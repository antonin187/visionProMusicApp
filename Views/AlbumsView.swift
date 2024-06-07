//
//  AlbumsView.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 16/05/2024.
//

import SwiftUI

struct AlbumsView: View {
    @State private var searchText: String = ""
    
    var filteredAlbums: [Album] {
        if searchText.isEmpty {
            return albums
        } else {
            return albums.filter { $0.title.localizedCaseInsensitiveContains(searchText)
                || $0.artist.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
  
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 160, maximum: 200))]
    var body: some View {
        ScrollView {
            TextField("Search in Albums", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            
            LazyVGrid(columns: columns, spacing: 24) {
                ForEach(filteredAlbums) { album in
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        VStack (alignment: .leading) {
                            AsyncImage(url: URL(string: album.image)) { image in
                                image.resizable()
                            } placeholder: {
                                Rectangle().foregroundStyle(.tertiary)
                            }.aspectRatio(1, contentMode: .fill)
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text(album.title)
                                .lineLimit(1)
                            Text(album.artist.name)
                                .foregroundStyle(.tertiary)
                                .lineLimit(1)
                        }.hoverEffect()
                    }.buttonStyle(.plain)
                }
            }
        }.padding(.horizontal, 24)
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                VStack (alignment: .leading) {
                    Text("Albums")
                        .font(.largeTitle)
                    Text("\(albums.count) albums")
                        .foregroundStyle(.tertiary)
                }
            }
            ToolbarItem {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "line.3.horizontal.decrease")
                }).buttonBorderShape(.circle)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                HStack {
                    Button {} label: {
                        Image(systemName: "backward.fill")
                    }
                    
                    Button {
                        audioPlayerViewModel.isPlaying.toggle()
                        audioPlayerViewModel.setCurrentMusic(musicName: "What's Good")
                        audioPlayerViewModel.playOrPause()
                    } label: {
                        Image(systemName: audioPlayerViewModel.isPlaying ? "pause.fill" : "play.fill")
                    }
                    
                    Button {} label: {
                        Image(systemName: "forward.fill")
                    }
                    
                    PlayingSongCardView()
                    
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

struct PlayingSongCardView: View {
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://i.postimg.cc/mg1vYcbN/IGOR.jpg")) { image in
                image.resizable()
            } placeholder: {
                Rectangle().foregroundStyle(.tertiary)
            }.frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 6))
            
            VStack (alignment: .leading) {
                Text("IGOR")
                Text("Tyler, The Creator")
                    .font(.caption2)
                    .foregroundStyle(.tertiary)
            }.frame(width: 160, alignment: .leading)
            
            Button(action: {}) {
                Image(systemName: "ellipsis")
            }.buttonBorderShape(.circle)
        }
        .padding(.all, 8)
        .background(.regularMaterial, in: .rect(cornerRadius: 14))
    }
}

#Preview(windowStyle: .automatic) {
    NavigationStack {
        AlbumsView()
    }
}
