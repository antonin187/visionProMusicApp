//
//  ContentView.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 15/05/2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationSplitView {
                // Side Menu
                SideBarView()
            } detail: {
                // Album View
                AlbumsView()
            }.tabItem {
                Label("Browse", systemImage: "music.note")
            }.tag(0)
            
            Text("Favorite")
                .tabItem {
                    Label("Favorite", systemImage: "heart.fill")
                }.tag(1)
            
            Text("Playlist")
                .tabItem {
                    Label("Playlist", systemImage: "play.square.stack")
                }.tag(1)
        }
    }
}

#Preview(windowStyle: .automatic) {
    NavigationStack {
        ContentView()
    }
}

