//
//  CharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 31/01/2024.
//

import Foundation

protocol EpisodeDataRender{
    var name:String {get}
    var episode:String {get}
    var air_date:String {get}

}

final class CharacterEpisodeCollectionViewCellViewModel{
    
    private let episodeDataUrl: URL?
    private var isFetching = false
    private var dataBlock:((EpisodeDataRender)->Void)?
    private var episode:RMEpisode?{
        didSet{
            guard let model  = episode else{
                return
            }
           dataBlock?(model)
        }
    }
    
    //MARK: - Public
    
    public func registerForData(_ block: @escaping(EpisodeDataRender)->Void){
        self.dataBlock = block
    }
    
    //MARK: - Init
    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
    
    public func fetchEpisode(){
        guard !isFetching else{
            if let model = episode{
                dataBlock?(model)
            }
            return
        }
        guard let url = episodeDataUrl
            , let request = RMRequest(url: url) else{
            return
        }
        
        isFetching = true
        
        RMService.shared.excute(request, expecting: RMEpisode.self) {[weak self] result in
            switch result{
            case .success(let model):
                DispatchQueue.main.async {
                    self?.episode = model
                }
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
}
