//
//  RMCharacterVC.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 23/10/2023.
//

import UIKit

/// Controller to show and search for character
final class RMCharacterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        RMService.shared.excute(.listCharactersRequests, expecting: RMGetAllCharactersResponse.self) { result in
            switch result{
            case.success(let model):
                print("Total: "+String(model.info.count))
            case.failure(let error):
                print(String(describing: error))
            }
        }
        
        
    }
    

   

}
