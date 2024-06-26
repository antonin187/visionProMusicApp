//
//  AlbumsByArtistView.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 15/06/2024.
//

import SwiftUI

struct AlbumsByArtistView: View {
    @Binding var isPresentedSheet: Bool;
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
    @State var selectedPanel = 1
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 160, maximum: 200))]
    var body: some View {
        VStack {
                HStack{
                    Spacer()
                    Button(action: {
                        isPresentedSheet = false
                    }, label: {
                        Image(systemName: "xmark")
                    }).buttonBorderShape(.circle)
                }
            VStack {
                
                
                AsyncImage(url: URL(string: audioPlayerViewModel.getSelectedArtist().image!)) { image in
                        image.resizable()
                    } placeholder: {
                        Rectangle().foregroundStyle(.tertiary)
                    }
                    .aspectRatio(1, contentMode: .fill)
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 30)
                
                    VStack{
                        Text(audioPlayerViewModel.getSelectedArtist().name).font(.extraLargeTitle2)
                    }
                
                Picker("Que voulez-vous afficher", selection: $selectedPanel) {
                    Text("Tous les albums").tag(1)
                    Text("Tous les titres").tag(2)
                    Text("À propos").tag(3)
                }
                .pickerStyle(.segmented)
                
                switch selectedPanel {
                    case 1:
                        LazyVGrid(columns: columns, spacing: 24) {
                            ForEach(audioPlayerViewModel.getSelectedArtist().getAllAlbums()) { album in
                                Button(action: {}) {
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
                                    .padding(5)
                            }
                        }
                        .frame(width: 700)
                        .padding(.vertical, 20)
                    case 2:
                    ScrollView {
                        ForEach(audioPlayerViewModel.getSelectedArtist().getAllSongs()) { song in
                            SongCell(song: song).frame(width: 700)
                        }
                    }
                    .padding(.vertical, 20)
                    case 3:
                    ScrollView {
                        HStack{
                            VStack(spacing: 25) {
                                if let worldRanking = audioPlayerViewModel.getSelectedArtist().worldRanking {
                                    VStack{
                                        Text("#\(formatNumber(worldRanking))")
                                            .font(.system(size: 30))
                                            .fontWeight(.semibold)
                                        Text("in the world")
                                            .font(.system(size: 15))
                                    }
                                    .frame(width: 130, height: 130)
                                    .clipShape(Circle())
                                    .background(Circle().fill(Color.blue))
                                    
                                }
                                
                                    VStack(alignment: .leading, spacing: 25) {
                                        VStack(alignment: .leading) {
                                            Text(formatNumber(audioPlayerViewModel.getSelectedArtist().followers!))
                                                .font(.system(size: 35))
                                                .fontWeight(.bold)
                                            Text("Followers")
                                                .foregroundStyle(.secondary)
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            Text(formatNumber(audioPlayerViewModel.getSelectedArtist().listenings!))
                                                .font(.system(size: 35))
                                                .fontWeight(.bold)
                                            Text("Monthly Listeners")
                                                .foregroundStyle(.secondary)
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            Text("Santigo, CL")
                                                .fontWeight(.bold)
                                            Text("Many Listeners")
                                                .foregroundStyle(.secondary)
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            Text("Mexico City, MX")
                                                .fontWeight(.bold)
                                            Text("Many Listeners")
                                                .foregroundStyle(.secondary)
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            Text("Sydney, AU")
                                                .fontWeight(.bold)
                                            Text("Many Listeners")
                                                .foregroundStyle(.secondary)
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            Text("São Paulo, BR")
                                                .fontWeight(.bold)
                                            Text("Many Listeners")
                                                .foregroundStyle(.secondary)
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            Text("London, GB")
                                                .fontWeight(.bold)
                                            Text("Many Listeners")
                                                .foregroundStyle(.secondary)
                                        }

                                }
                                Spacer()
                            }
                            .frame(width: 250)
                            VStack {
                                if let description = audioPlayerViewModel.getSelectedArtist().description {
                                    Text(description)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.vertical, 20)
                    }.frame(width: 700)
                    default:
                        ForEach(audioPlayerViewModel.getSelectedArtist().getAllSongs()) { song in
                            SongCell(song: song).frame(width: 700)
                        }
                    }
            }
        }.padding(30)
    }
}

