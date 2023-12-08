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
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else{return nil}
                        return "\($0.name) = \(value)"}).joined(separator: "&")
            string += argumentString
        }
        
        return string
    }
    
    /// Computed & constructed API url
  public var url:URL?{
        return URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "Get"
    
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

}

extension RMRequest{
    static let listCharactersRequests = RMRequest(endPoint: .character)
}
