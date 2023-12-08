//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 26/10/2023.
//

import Foundation

struct RMLocation: Codable{
    
    let results  : [LocationResult]
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}

//MARK:- LocationResult

struct LocationResult:Codable{
    let id: Int
    let name,type,dimension:String
    let residents:[String]
    let url: String
    let created: String
}






