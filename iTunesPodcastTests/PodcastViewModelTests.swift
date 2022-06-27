//
//  PodcastListViewTests.swift
//  iTunesPodcastTests
//
//  Created by Artem - Home on 27.06.2022.
//

import XCTest
import Combine
@testable import iTunesPodcast

final class PodcastViewModelTests : PodcastTestCase {
    private var sut: PodcastViewModel!
    private var mockAPIClient: MockPodcastAPIClient!
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        mockAPIClient = MockPodcastAPIClient()
        sut = PodcastViewModel(apiClient: mockAPIClient)
        cancellables = []
        super.setUp()
    }
    
    override func tearDown() {
        mockAPIClient = nil
        sut = nil
        super.tearDown()
    }
    
    func testFetchPodcasts_itShouldFail() {
        let expectation = XCTestExpectation(description: "State is set to populated")
        let error = MockPodcastAPIClient.Error.mockError
        sut.$viewState.dropFirst().sink { state in
            switch state {
            case .failed:
                expectation.fulfill()
            case .response:
                XCTFail("Unexcpected state")
            case .loading:
                break
            }
            
        }.store(in: &cancellables)
        mockAPIClient.fetchJobsResult = Result.failure(error).publisher.eraseToAnyPublisher()

        sut.fetchPodcasts(withSearchTerm: randomString)
        wait(for: [expectation], timeout: 1)
    }
    
    func testFetchPodcasts_itShouldSuccess() {
        let expectation = XCTestExpectation(description: "State is set to populated")
        let podcasts = [randomPodcast]
        let response = PodcastResponse(resultCount: 1, results: podcasts)
        sut.$viewState.dropFirst().sink { state in
            switch state {
            case .response(let response):
                XCTAssertEqual(podcasts, response.results)
                expectation.fulfill()
            case .failed:
                XCTFail("Unexcpected state")
            case .loading:
                break
            }
            
        }.store(in: &cancellables)
        
        mockAPIClient.fetchJobsResult = Result.success(response).publisher.eraseToAnyPublisher()

        sut.fetchPodcasts(withSearchTerm: randomString)
        wait(for: [expectation], timeout: 1)
    }
    
}

