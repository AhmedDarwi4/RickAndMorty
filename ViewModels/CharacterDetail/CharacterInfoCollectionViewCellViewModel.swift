//
//  CharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 31/01/2024.
//

import UIKit
final class CharacterInfoCollectionViewCellViewModel{
    private let type :`Type`
    private let value: String
    
    static let dateFormatter:DateFormatter = {
        // format 2017-11-04T18:50:21.651Z
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        formatter.timeZone = .current
        return formatter
    }()
    
    static let shortDateFormatter:DateFormatter = {
        // format 2017-11-04T18:50:21.651Z
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US") // Set locale to English
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.timeZone = .current
        return formatter
    }()
    
    public var title: String{
        self.type.displayTitle
    }
    
    public var displayValue:String{
        if value .isEmpty{
            return "None"
        }
        
        if let date = Self.dateFormatter.date(from: value),type == .created{
            return Self.shortDateFormatter.string(from: date)

        }
        return value
    }
    
    public var iconImage:UIImage?{
        return self.type.iconImage
    }
    
    public var tintColor:UIColor{
        return self.type.tintColor
    }
    
    enum `Type`:String {
    case status
    case gender
    case type
    case species
    case origin
    case location
    case created
    case episodeCount
        
        var tintColor:UIColor{
            switch self{
            case .status:
                return .systemBlue
            case .gender:
                return .systemRed
            case .type:
                return .systemPurple
            case .species:
                return .systemGreen
            case .origin:
                return .systemOrange
            case .location:
                return .systemPink
            case .created:
                return .systemYellow
            case .episodeCount:
                return .systemMint
            }
        }
        
    var displayTitle:String{
            switch self{
            case .status,
                    .gender,
                    .type,
                    .species,
                    .origin,
                    .location,
                    .created:return rawValue.uppercased()
            case.episodeCount:
                return "EPISODE COUNT"
               
            }
        }
        
        var iconImage:UIImage?{
            switch self{
            case .status:
                return UIImage(systemName: "bell")
            case .gender:
                return UIImage(systemName: "bell")
            case .type:
                return UIImage(systemName: "bell")
            case .species:
                return UIImage(systemName: "bell")
            case .origin:
                return UIImage(systemName: "bell")
            case .location:
                return UIImage(systemName: "bell")
            case .created:
                return UIImage(systemName: "bell")
            case .episodeCount:
                return UIImage(systemName: "bell")
            }
        }
    }
    
    
    init(type:`Type`, value:String){
        self.type = type
        self.value = value
      
    }
}
