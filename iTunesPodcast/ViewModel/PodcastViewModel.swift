//
//  NetworkManager.swift
//  iTunesPodcast
//
//  Created by Artem - Home on 27.06.2022.
//

import Foundation
import Combine

class PodcastViewModel : ObservableObject {
    enum ViewState {
        case loading
        case response(PodcastResponse)
        case failed(Error)
    }

    private let apiClient: PodcastAPIClientProtocol
    private var sharedFetchPodcasts: AnyCancellable?
    
    init(apiClient: PodcastAPIClientProtocol) {
        self.apiClient = apiClient
    }
    
    @Published var viewState: ViewState = .loading
    
    func fetchPodcasts(withSearchTerm term: String) {
        viewState = .loading
        sharedFetchPodcasts = apiClient.fetchPodcasts(withSearchTerm: term)
        .sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                self.viewState = .failed(error)
            case .finished:
                break
            }
        }, receiveValue: { value in
            self.viewState = .response(value)
        })
    }
}

