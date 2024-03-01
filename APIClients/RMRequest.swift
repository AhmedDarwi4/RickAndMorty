//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 25/10/2023.
//

import Foundation
/// Object that represents a single API call
final class RMRequest{
    //Base url
    //Endpoint
    //Path components
    //Query parameters
    
    
    /// API constants
    private struct Constants{
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint
    private  let endPoint :RMEndPoint
    
    /// Path components for API if any
    private  let pathComponents:[String]
    
    /// Query arguments for API if any
    private  let queryParameters:[URLQueryItem]
    
    /// Constructed url for the api request in string format
    private var urlString:String{
        var string = Constants.baseURL
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponents .isEmpty{
            pathComponents.forEach({string += "/\($0)"})
        }
        
        if !queryParameters .isEmpty{
            string += "?"
            // name=value&name=value
            let argumentString = queryParameters
                .compactMap { "\($0.name)=\($0.value?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")" }
                .joined(separator: "&")
            string += argumentString
        }
        
        return string
    }
    
    /// Computed & constructed API url
    public var url:URL?{
        return URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    
    //MARK:- public
    
    /// <#Description#>
    /// - Parameters:
    ///   - endPoint: Target endpoint
    ///   - pathComponents: Collection of path components
    ///   - queryParameters: Collection of query parameters
    public init(endPoint:RMEndPoint,
                pathComponents:[String] = [],
                queryParameters:[URLQueryItem] = []
    )
    {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    /// Attempt to create request
    /// - Parameter url: URL to parse
    convenience init?(url: URL) {
        let string = url.absoluteString
        if !string.contains(Constants.baseURL) {
            return nil
        }
        let trimmed = string.replacingOccurrences(of: Constants.baseURL+"/", with: "")
        if trimmed.contains("/") {
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty {
                let endpointString = components[0] // Endpoint
                var pathComponents: [String] = []
                if components.count > 1 {
                    pathComponents = components
                    pathComponents.removeFirst()
                }
                if let rmEndpoint = RMEndPoint(
                    rawValue: endpointString
                ) {
                    self.init(endPoint: rmEndpoint, pathComponents: pathComponents)
                    return
                }
            }
        } else if trimmed.contains("?") {
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty, components.count >= 2 {
                let endpointString = components[0]
                let queryItemsString = components[1]
                // value=name&value=name
                let queryItems: [URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap({
                    guard $0.contains("=") else {
                        return nil
                    }
                    let parts = $0.components(separatedBy: "=")

                    return URLQueryItem(
                        name: parts[0],
                        value: parts[1]
                    )
                })

                if let rmEndpoint = RMEndPoint(rawValue: endpointString) {
                    self.init(endPoint: rmEndpoint, queryParameters: queryItems)
                    return
                }
            }
        }

        return nil
    }
}

// MARK: - Request convenience

extension RMRequest {
    static let listCharactersRequests = RMRequest(endPoint: .character)
   
}
