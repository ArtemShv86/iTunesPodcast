//
//  PodcastTestCase.swift
//  iTunesPodcastTests
//
//  Created by Artem - Home on 27.06.2022.
//

import XCTest
import SwiftUI
@testable import iTunesPodcast

class PodcastTestCase : XCTestCase {
    var randomPodcast: Podcast {
        Podcast(
            id: randomInt,
            artistName: randomString,
            trackName: randomString,
            releaseDate: randomString,
            artworkUrl: randomString
        )
    }
    
    var randomInt: Int {
        Int.random(in: 0..<10000)
    }
    
    var randomString: String {
        NSUUID().uuidString
    }
    
    var randomImage: Image {
        return Image("")
    }

}
