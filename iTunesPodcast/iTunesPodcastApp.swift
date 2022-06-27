//
//  iTunesPodcastApp.swift
//  iTunesPodcast
//
//  Created by Artem - Home on 27.06.2022.
//

import SwiftUI

@main
struct iTunesPodcastApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(apiClient: PodcastAPIClient())
        }
    }
}
