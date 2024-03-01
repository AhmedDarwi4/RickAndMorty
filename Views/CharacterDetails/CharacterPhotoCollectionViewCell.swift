//
//  CharacterPhotoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 31/01/2024.
//

import UIKit

final class CharacterPhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "CharacterPhotoCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    public func configure(with viewModel:CharacterPhotoCollectionViewCellViewModel){
        viewModel.fetchImage {[weak self] result in
            switch result {
            case .success(let data):
                self?.imageView.image = UIImage(data: data)
            case .failure:
                break
            }
        }
    }
    
    
    
}
