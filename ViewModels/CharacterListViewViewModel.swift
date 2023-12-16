//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 12/12/2023.
//

import UIKit

final class CharacterListViewViewModel:NSObject{
    func fetchCharacters(){
        RMService.shared.excute(.listCharactersRequests, expecting: RMGetAllCharactersResponse.self) { result in
            switch result{
            case.success(let model):
                print("Total: "+String(model.results.first?.image ?? "no image"))
            case.failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension CharacterListViewViewModel:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.cellIdentifier, for: indexPath) as? CharacterCollectionViewCell else {
            fatalError("Unable to dequeue CharacterCollectionViewCell with identifier \(CharacterCollectionViewCell.cellIdentifier)")
        }

        let viewModel = CharacterCollectionViewCellViewModel(characterName: "Ahmed", characterStatus: .alive, characterImageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        cell.configure(with: viewModel)
        cell.contentView.backgroundColor = .secondarySystemBackground

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width =  (bounds.width-30)/2
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
}
