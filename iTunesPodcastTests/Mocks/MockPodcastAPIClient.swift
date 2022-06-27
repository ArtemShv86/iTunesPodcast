//
//  MockPodcastAPIClient.swift
//  iTunesPodcastTests
//
//  Created by Artem - Home on 27.06.2022.
//

import Combine
@testable import iTunesPodcast

final class MockPodcastAPIClient : PodcastAPIClientProtocol {
    enum Error: Swift.Error {
        case mockError
    }
    
    var fetchJobsResult: AnyPublisher<PodcastResponse, Swift.Error>!
    func fetchPodcasts(withSearchTerm term: String) -> AnyPublisher<PodcastResponse, Swift.Error> {
        return fetchJobsResult
    }
}


