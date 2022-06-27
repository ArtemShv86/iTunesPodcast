//
//  ContentView.swift
//  iTunesPodcast
//
//  Created by Artem - Home on 27.06.2022.
//

import SwiftUI

struct PodcastView : View {
    @ObservedObject var viewModel: PodcastViewModel
    
    var body: some View {
        VStack {
            switch viewModel.viewState {
            case .loading:
                ProgressView()
            case .failed:
                Text(localizedString("podcasts.error.text"))
            case .response(let response):
                if response.results.isEmpty {
                    Text(localizedString("podcasts.noResults.text"))
                } else {
                    List(response.results, id: \.id) {
                        PodcastRowView(podcast: $0)
                    }
                }
            }
        }
    }
}

struct PodcastRowView : View {
    let podcast: Podcast
    
    var body: some View {
        NavigationLink(destination: PodcastDetailsView(podcast: podcast)) {
            HStack {
                PodcastImage(imageURL: podcast.artworkUrl)
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading, spacing: 5) {
                    Text(podcast.artistName)
                        .font(.headline)
                    Text(podcast.trackName)
                        .font(.subheadline)
                }
                .padding()
            }
        }
    }
}

struct PodcastListView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastView(viewModel: PodcastViewModel(apiClient: PodcastAPIClient()))
    }
}

func localizedString(_ string: String) -> String {
    NSLocalizedString(string, comment: "")
}


