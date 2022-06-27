//
//  PodcastAPIClient.swift
//  iTunesPodcast
//
//  Created by Artem - Home on 27.06.2022.
//

import Combine
import Foundation

protocol PodcastAPIClientProtocol {
    func fetchPodcasts(withSearchTerm term: String) -> AnyPublisher<PodcastResponse, Error>
}

class PodcastAPIClient : PodcastAPIClientProtocol {
    private let baseUrlString = "https://itunes.apple.com"
    private var urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetchPodcasts(withSearchTerm term: String) -> AnyPublisher<PodcastResponse, Error> {
        guard let url = URL(string: "\(baseUrlString)/search?term=\(term)&entity=podcast") else {
            return Fail(error: NSError(domain: "Missing URL", code: -10001, userInfo: nil))
                .eraseToAnyPublisher()
        }
        return urlSession.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: PodcastResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

