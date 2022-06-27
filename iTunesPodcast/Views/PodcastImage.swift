//
//  NetworkImage.swift
//  iTunesPodcast
//
//  Created by Artem - Home on 27.06.2022.
//

import SwiftUI

struct PodcastImage : View {
    let imageURL: String
    
    var body: some View {
        CacheAsyncImage(url: URL(string: imageURL)) { image in
            if let image = image.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                Image(systemName: "video")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
           }
        }
    }
}
