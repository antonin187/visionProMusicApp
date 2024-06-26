//
//  SongsByAlbumView.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 11/06/2024.
//

import SwiftUI

struct SongsByAlbumView: View {
    @Binding var isPresentedSheet: Bool;
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
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
            ScrollView {
                
                
                    AsyncImage(url: URL(string: audioPlayerViewModel.getSelectedAlbum().image)) { image in
                        image.resizable()
                    } placeholder: {
                        Rectangle().foregroundStyle(.tertiary)
                    }
                    .aspectRatio(1, contentMode: .fill)
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 7))
                    .frame(width: 400, height: 400)
                    .padding(.bottom, 30)
                
                    VStack{
                        Text(audioPlayerViewModel.getSelectedAlbum().title).font(.extraLargeTitle2)
                        Text("\(audioPlayerViewModel.getSelectedAlbum().artist.name)")
                            .font(.title)
                            .foregroundStyle(.secondary)
                            .padding(.bottom, 20)


                    }
                
                    ForEach(audioPlayerViewModel.getSelectedAlbum().getAllSongs()) { song in
                        SongCell(song: song).frame(width: 700)
                    }
            }
        }.padding(30)
    }
}

