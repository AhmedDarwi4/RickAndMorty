//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 08/12/2023.
//

import Foundation

struct RMGetAllCharactersResponse:Codable{
    
    let info:Info
    let results:[RMCharacter]
    
    //MARK: - Info
    struct Info:Codable{
        let count,pages:Int
        let next,prev:String?
    }


}


