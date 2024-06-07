//
//  visionProMusicAppApp.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 15/05/2024.
//

import SwiftUI

@main
struct visionProMusicAppApp: App {
    var audioPlayerViewModel = AudioPlayerViewModel.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioPlayerViewModel)
        }
    }
}
