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
    @State private var volume: CGFloat = 0.7
    @State private var isShowingSheet = false
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
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
                }.tag(2)
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                HStack {
                    Button {} label: {
                        Image(systemName: "backward.fill")
                    }
                    .simultaneousGesture(
                        TapGesture(count: 1).onEnded {
                            audioPlayerViewModel.replayMusic()
                        }
                    )
                    .simultaneousGesture(
                        TapGesture(count: 2).onEnded {
                            audioPlayerViewModel.playPreviousMusic()
                        }
                    )
                    
                    Button {
                        audioPlayerViewModel.isPlaying.toggle()
                        audioPlayerViewModel.playOrPause()
                    } label: {
                        Image(systemName: audioPlayerViewModel.isPlaying ? "pause.fill" : "play.fill")
                    }
                    
                    Button {
                        audioPlayerViewModel.playNextMusic()
                    } label: {
                        Image(systemName: "forward.fill")
                    }
                    
                        
                    Button(action: {
                        isShowingSheet = true
                    }) {
                        PlayingSongCardView()
                    }.sheet(isPresented: $isShowingSheet, content: {
                        SongPlayerView(isShowingSheet: $isShowingSheet)
                    })
                    
                    Button {} label: {
                        Image(systemName: "quote.bubble")
                    }
                    
                    Button {} label: {
                        Image(systemName: "list.bullet")
                    }
                    
                    VolumeSlider(
                            sliderProgress: $volume,
                            symbol: .init(
                                icon: "speaker.wave.3.fill",
                                tint: .gray,
                                font: .system(size: 15),
                                padding: 20
                            ),
                            axis: .horizontal,
                            tint: .white
                    )
                    .frame(width: 220, height: 30)
                    .frame(maxHeight: .infinity)
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    NavigationStack {
        ContentView()
    }
}

