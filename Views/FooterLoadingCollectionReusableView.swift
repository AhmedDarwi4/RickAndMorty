//
//  FooterLoadingCollectionReusableView.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 22/12/2023.
//

import UIKit

class FooterLoadingCollectionReusableView: UICollectionReusableView {
  
    static let identifier  = "FooterLoadingCollectionReusableView"

   private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
       spinner.hidesWhenStopped = true
       spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubviews(spinner)
        addConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraint(){
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    public func startAnimating(){
        spinner.startAnimating()
    }
    
}


