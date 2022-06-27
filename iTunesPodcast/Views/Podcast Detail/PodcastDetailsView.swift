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
            VStack(alignment: .center, spacing: 10) {
                PodcastImage(imageURL: podcast.artworkUrl)
                    .frame(width: 100, height: 100)
                Text(podcast.artistName)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Text(podcast.trackName)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                Text(podcast.releaseDate, style: .date)
                    .font(.subheadline)
            }

        }
        .padding()
        .navigationTitle(localizedString("details.navigationTitle"))
    }

}
