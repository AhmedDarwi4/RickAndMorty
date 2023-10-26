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
    
    /// Send Rick And Morty API Call
    /// - Parameters:
    ///   - _request: Request instance
    ///   - completion: Callback with data or error
    public func excute(_request:RMRequest,completion:@escaping() ->Void){
        
    }
}
