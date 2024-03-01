//
//  CharacterEpisodeCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 31/01/2024.
//

import UIKit

final class CharacterEpisodeCollectionViewCell: UICollectionViewCell {
    static let identifier = "CharacterEpisodeCollectionViewCell"
    
    private let seasonlabel:UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font  = .systemFont(ofSize: 20,weight: .semibold)
        return label
    }()
    
    private let nameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
}()
    
    private let airDateLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
}()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.systemBlue.cgColor
        contentView.addSubviews(seasonlabel,nameLabel,airDateLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            seasonlabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            seasonlabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            seasonlabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            seasonlabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
            nameLabel.topAnchor.constraint(equalTo: seasonlabel.bottomAnchor),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            nameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
            airDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            airDateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            airDateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            airDateLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.seasonlabel.text = nil
        self.nameLabel.text = nil
        self.airDateLabel.text = nil
    }
    
    public func configure(with viewModel:CharacterEpisodeCollectionViewCellViewModel){
        viewModel.registerForData {[weak self] data in
            self?.seasonlabel.text = "Episode \(data.episode)"
            self?.nameLabel.text = data.name
            self?.airDateLabel.text = "Aired on \(data.air_date)"
        }
        viewModel.fetchEpisode()
    }

}
