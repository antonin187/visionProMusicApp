//
//  SongCell.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 18/05/2024.
//

import SwiftUI

struct SongCell: View {
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
    var song: Song
    var body: some View {
        HStack {
            // Picture
            AsyncImage(url: URL(string: song.album.image)) { image in
                image.resizable()
            } placeholder: {
                Rectangle().foregroundStyle(.tertiary)
            }.aspectRatio(1, contentMode: .fill)
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 7))
                .frame(width: 60, height: 60)
            
            // Infos
            VStack (alignment: .leading) {
                Text(song.title)
                    .lineLimit(1)
                Text(featuringBuilder(song: song))
                    .foregroundStyle(.tertiary)
                    .lineLimit(1)
            }
            
            Spacer()

            // Dowloaded
            Image(systemName: "arrow.down.circle.fill")
                .padding(.horizontal, 2)
            Image(systemName: "ellipsis")
                .padding(.horizontal, 2)
            // Dots
        }.onTapGesture {
            audioPlayerViewModel.stopMusic()
            audioPlayerViewModel.playNewSong(song: song)
        }
    }
    
    func featuringBuilder(song: Song) -> String {
        var finalFeaturingchain = song.album.artist.name
        if song.featurings.count > 0 {
            for featuring in song.featurings {
                finalFeaturingchain += ", \(featuring.name)"
            }
        }
        return finalFeaturingchain
    }
}

#Preview {
    SongCell(song: songs[19])
}
