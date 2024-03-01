//
//  CharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 14/12/2023.
//

import Foundation
final class CharacterCollectionViewCellViewModel:Hashable,Equatable{
    
  
    
    public let characterName:String
    private let characterStatus:RMCharacterStatus
    private let characterImageUrl:URL?
    
    init(characterName:String,characterStatus:RMCharacterStatus,characterImageUrl:URL?){
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    
    public var characterStatusText:String{
        return "Status: \(characterStatus.text)"
    }
    
    // Todo: Abstract to Image Manager
    public func fetchImage(completion: @escaping(Result<Data,Error>)->Void){
        guard let url  = characterImageUrl else{
            completion(.failure(URLError(.badURL)))
            return
        }
        
        ImageLoader.shared.downloadImage(url, completion: completion)

  
    }
    
    // MARK: - Hashable

    static func == (lhs: CharacterCollectionViewCellViewModel, rhs: CharacterCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(characterName)
        hasher.combine(characterStatus)
        hasher.combine(characterImageUrl)
    }

}


