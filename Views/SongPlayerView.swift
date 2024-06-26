//
//  SongPlayerView.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 07/06/2024.
//

import SwiftUI

struct SongPlayerView: View {
    @Binding var isShowingSheet: Bool
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    isShowingSheet = false
                }, label: {
                    Image(systemName: "xmark")
                }).buttonBorderShape(.circle)
            }
            VStack(spacing: 50){
                HStack {
                    AsyncImage(url: URL(string: audioPlayerViewModel.currentSong.album.image)) { image in
                        image.resizable()
                    } placeholder: {
                            Rectangle().foregroundStyle(.tertiary)
                        }.aspectRatio(1, contentMode: .fill)
                            .frame(width: 400, height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                }.padding(.horizontal, 50)
                
                VStack{
                    Text(audioPlayerViewModel.currentSong.title).font(.extraLargeTitle2)
                    Text("\(audioPlayerViewModel.currentSong.album.artist.name)\(audioPlayerViewModel.currentSong.featurings.isEmpty ? "" : ", \(audioPlayerViewModel.currentSong.featurings.map { $0.name }.joined(separator: " & "))")")
                        .font(.title)
                        .foregroundStyle(.secondary)


                }
                
                VStack {
                    Slider(value: $audioPlayerViewModel.currentTime, in: 0...audioPlayerViewModel.duration, onEditingChanged: { isEditing in
                        if !isEditing {
                            audioPlayerViewModel.updateCurrentTime(to: audioPlayerViewModel.currentTime)
                        }
                    })
                    HStack {
                        Text(timeString(from: audioPlayerViewModel.currentTime))
                        Spacer()
                        Text(timeString(from: audioPlayerViewModel.duration))
                    }
                }.padding(.horizontal, 50)
                
                HStack(spacing: 100) {
                    Button {} label: {
                        Image(systemName: "backward.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    }.buttonStyle(.plain)
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
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    }.buttonStyle(.plain)
                    
                    Button {
                        audioPlayerViewModel.playNextMusic()
                    } label: {
                        Image(systemName: "forward.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    }.buttonStyle(.plain)
                }
            }.padding(.vertical, 10)
        }.padding(30)
    }
    
    private func timeString(from time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
}
