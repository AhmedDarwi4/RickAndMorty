//
//  RMService.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 25/10/2023.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService{
    /// Shared singleton instance
    static let shared  = RMService()
    /// Privatised constructor
    private init (){}
    
    enum RMServiceError:Error{
        case failedToCreateRequest
        case failedToGetdata

    }
    
    /// Send Rick And Morty API Call
    /// - Parameters:
    ///   - _request: Request instance
    ///   - type:the type of object we expect to get back
    ///   - completion: Callback with data or error
    public func excute<T:Codable>(_ request:RMRequest,expecting type:T.Type, completion:@escaping(Result<T,Error>) ->Void){
        
       guard let urlRequest = self.request(from: request)else{
            
           completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
      //  print("API Call\(request.url?.absoluteString ?? "")")
        let task  = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data,error == nil else{
                completion(.failure(error ?? RMServiceError.failedToGetdata))
                return
            }
            
            //Decode response
            do{
                let result  = try JSONDecoder().decode(type, from: data)
                completion(.success(result))
                print(String(describing: result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    //Mark:- Private
    
    private func request(from rmRequest:RMRequest)->URLRequest?{
        guard let url = rmRequest.url else{return nil}
        var request  = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        
        
        return request
    }
    
    
}
