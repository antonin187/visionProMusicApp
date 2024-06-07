//
//  AudioPlayerViewModel.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 07/06/2024.
//

import Foundation
import AVFoundation

class AudioPlayerViewModel: ObservableObject {
    static let shared = AudioPlayerViewModel()
    var audioPlayer: AVAudioPlayer?
    var currentSong: Song = songs[Int.random(in: 1..<songs.count)]
    @Published var isPlaying = false

    private init() {
        if let sound = Bundle.main.path(forResource: getCurrentSong().title, ofType: "mp3") {
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
        } catch {
            print("AVAudioPlayer could not be instantiated.")
        }
        } else {
            print("Audio file could not be found.")
        }
    }
    
    func getCurrentSong() -> Song {
        return self.currentSong
    }
    
    func setCurrentSong(song: Song) {
        self.currentSong = song
    }
    
    func playNewSong(song: Song) {
        self.setCurrentSong(song: song)
        // Update the audio player with the new music file
        if let sound = Bundle.main.path(forResource: getCurrentSong().title, ofType: "mp3") {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
                self.audioPlayer?.prepareToPlay()
                playMusic()
            } catch {
                print("AVAudioPlayer could not be instantiated.")
            }
        } else {
            print("Audio file could not be found.")
        }
    }

    func playOrPause() {
    guard let player = audioPlayer else { return }

    if player.isPlaying {
      player.pause()
      isPlaying = false
    } else {
      player.play()
      isPlaying = true
    }
    }
    
    func playMusic() {
    guard let player = audioPlayer else { return }
        player.play()
        isPlaying = true
    }
    
    func stopMusic() {
    guard let player = audioPlayer else { return }
        player.pause()
        isPlaying = false
    }
    
    func playNextMusic() {
        if let index = songs.firstIndex(of: getCurrentSong()) {
            var indexToPlay = 0
            if index < songs.count - 1 {
                indexToPlay = index + 1
            }
            playNewSong(song: songs[indexToPlay])
        } else {
            playNewSong(song: songs[Int.random(in: 1..<songs.count)])
        }
    }
    
    func replayMusic() {
        if let index = songs.firstIndex(of: getCurrentSong()) {
            playNewSong(song: songs[index])
        } else {
            playNewSong(song: songs[Int.random(in: 1..<songs.count)])
        }
    }
    
    func playPreviousMusic() {
        if let index = songs.firstIndex(of: getCurrentSong()) {
            var indexToPlay = 0
            if index == 0 {
                indexToPlay = songs.count - 1
            } else {
                indexToPlay = index - 1
            }
            print(songs.count)
            playNewSong(song: songs[indexToPlay])
        } else {
            playNewSong(song: songs[Int.random(in: 1..<songs.count)])
        }
    }
}
