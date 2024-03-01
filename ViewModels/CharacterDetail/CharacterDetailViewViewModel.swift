//
//  CharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 21/12/2023.
//

import Foundation
import UIKit
final class CharacterDetailViewViewModel{
    private let character : RMCharacter
    public var episodes:[String]{
        character.episode
    }
    
    enum sectionType{
        case photo(viewModel:CharacterPhotoCollectionViewCellViewModel)
        case information(viewModel:[CharacterInfoCollectionViewCellViewModel])
        case episodes(viewModels:[CharacterEpisodeCollectionViewCellViewModel])
    }
    
    public var sections : [sectionType] = []
    
    //MARK: - Init
    
    init(character:RMCharacter){
        self.character = character
        setUpSections()
    }
    
    private func setUpSections(){
        sections = [.photo(viewModel: .init(imageUrl: URL(string: character.image))),
                    .information(viewModel: [
                        .init(type: .status ,value: character.status.text),
                        .init(type: .gender ,value: character.gender),
                        .init(type: .type ,value: character.type),
                        .init(type: .species ,value: character.species),
                        .init(type: .origin ,value: character.origin.name),
                        .init(type: .location ,value: character.location.name),
                        .init(type: .created ,value: character.created),
                        .init(type: .episodeCount ,value: "\(character.episode.count)"),
                                            ]),
                    .episodes(viewModels: character.episode.compactMap({
                        return CharacterEpisodeCollectionViewCellViewModel(episodeDataUrl: URL(string: $0))
                    }))
        
        ]
    }
    
    private var requestUrl:URL?{
        return URL(string: character.url)
    }
    
    public var title:String{
        character.name.uppercased()
    }
    
    //MARK: - Layouts
    
    public func createPhotoSectionLayout() -> NSCollectionLayoutSection{
        let item  = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
        
        let group  = NSCollectionLayoutGroup.vertical(layoutSize:  NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.5)
        ), subitems: [item]
                                                      
        )
        let section  = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    public func createInformationSectionLayout() -> NSCollectionLayoutSection{
        let item  = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let group  = NSCollectionLayoutGroup.horizontal(layoutSize:  NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(150)
        ), subitems: [item,item]
                                                        
        )
        let section  = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    public func createEpisodesSectionLayout() -> NSCollectionLayoutSection{
        let item  = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 8)
        
        let group  = NSCollectionLayoutGroup.horizontal(layoutSize:  NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.8),
            heightDimension: .absolute(150)
        ), subitems: [item]
                                                        
        )
        let section  = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
}
