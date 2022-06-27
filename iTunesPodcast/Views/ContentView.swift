//
//  ContentView.swift
//  iTunesPodcast
//
//  Created by Artem - Home on 27.06.2022.
//

import SwiftUI

struct ContentView : View {
    @ObservedObject var viewModel: PodcastViewModel
    @State private var queryString = "myheritage"
    
    init(apiClient: PodcastAPIClientProtocol) {
        self.viewModel = PodcastViewModel(apiClient: apiClient)
    }
    
    var body: some View {
        NavigationView {
            PodcastView(viewModel: viewModel)
                .navigationTitle(localizedString("podcasts.navigationTitle"))
                .searchable(text: $queryString)
                .onSubmit(of: .search) {
                    viewModel.fetchPodcasts(withSearchTerm: queryString)
                }
                .onAppear {
                    viewModel.fetchPodcasts(withSearchTerm: queryString)
                }
        }
        .navigationViewStyle(.stack)
    }
}
