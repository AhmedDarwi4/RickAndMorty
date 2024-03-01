//
//  RMEpisodeDetailVC.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 01/03/2024.
//

import UIKit

/// VC to show details about single episode
final class RMEpisodeDetailVC: UIViewController {
    
    let url:URL?
    
    // MARK: - Init
    init(url:URL?){
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }

    // MARK: - Lifecycle
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title  = "Episode"
        view.backgroundColor = .systemTeal
    }
    

 

}
