//
//  CacheAsyncImageTests.swift
//  iTunesPodcastTests
//
//  Created by Artem - Home on 27.06.2022.
//

import XCTest
import SwiftUI
@testable import iTunesPodcast

final class CacheAsyncImageTests : PodcastTestCase {
    
    private var cacheAsyncImage: CacheAsyncImage<Image>!
    
    override func setUp() {
        cacheAsyncImage = CacheAsyncImage<Image>(url: nil, content: { _ in
            return self.randomImage
        })
        super.setUp()
    }
    
    override func tearDown() {
        cacheAsyncImage = nil
        super.tearDown()
    }
    
    func testCacheAsyncImage_loadsImageFromCache() {
        let url = URL(string: randomString)!
        let expectedImage = randomImage
        let expectation = XCTestExpectation(description: "Cached image should be populated")
        ImageCache[url] = expectedImage
        cacheAsyncImage = CacheAsyncImage<Image>(url: url, content: { phase in
            XCTAssertEqual(phase.image, expectedImage)
            expectation.fulfill()
            return expectedImage
        })
        _ = cacheAsyncImage.body
        wait(for: [expectation], timeout: 1)
    }
}
