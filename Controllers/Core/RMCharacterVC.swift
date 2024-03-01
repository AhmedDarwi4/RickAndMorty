//
//  RMCharacterVC.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 23/10/2023.
//

import UIKit

/// Controller to show and search for character
final class RMCharacterVC: UIViewController,CharacterListViewDelegate {
   
    
    private let characterListView = CharacterListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        setupView()
    }
    
    private func setupView(){
        characterListView.delegate = self
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    // MARK: - CharacterListViewDelegate
    
    func rmCharacterListView(_ characterListView: CharacterListView, didSelectCharacter character: RMCharacter) {
        // open detail controller for that character
        let viewModel = CharacterDetailViewViewModel(character: character)
        let detailVC = RMCharaterDetailVC(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
}
