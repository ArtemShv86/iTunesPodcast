//
//  Podcast.swift
//  iTunesPodcast
//
//  Created by Artem - Home on 27.06.2022.
//

import Foundation

struct Podcast : Identifiable, Equatable, Codable {
    let id: Int
    let artistName: String
    let trackName: String
    let releaseDate: String
    let artworkUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case artistName
        case trackName
        case releaseDate
        case artworkUrl = "artworkUrl100"
    }
    
}
