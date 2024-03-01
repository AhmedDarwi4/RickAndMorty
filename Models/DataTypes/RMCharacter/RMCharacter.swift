//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 26/10/2023.
//

import Foundation

struct RMCharacter:Codable{
    let id: Int
    let name,species, type: String
    let status:RMCharacterStatus
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
  
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}


