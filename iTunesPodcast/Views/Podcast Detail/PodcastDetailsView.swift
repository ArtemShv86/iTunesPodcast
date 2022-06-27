//
//  DetailsView.swift
//  iTunesPodcast
//
//  Created by Artem - Home on 27.06.2022.
//

import SwiftUI

struct PodcastDetailsView : View {
    let podcast: Podcast

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center) {
                PodcastImage(imageURL: podcast.artworkUrl)
                    .frame(width: 100, height: 100)
                Text(podcast.artistName)
                    .font(.headline)
                Text(podcast.trackName)
                    .font(.subheadline)
                Text(podcast.releaseDate)
                    .font(.subheadline)
            }
        }
        .navigationTitle(localizedString("details.navigationTitle"))
    }

}
