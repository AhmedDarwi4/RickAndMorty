//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Ahmed Darwish on 26/02/2024.
//

import Foundation

struct RMEpisode:Codable, EpisodeDataRender {
    let id: Int
    let name,air_date,episode,url,created:String
    let characters:[String]
}
