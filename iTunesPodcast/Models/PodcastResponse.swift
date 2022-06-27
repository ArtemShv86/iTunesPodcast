//
//  PodcastResponse.swift
//  iTunesPodcast
//
//  Created by Artem - Home on 27.06.2022.
//

import Foundation

struct PodcastResponse : Codable {
    let resultCount: Int
    let results: [Podcast]
}
