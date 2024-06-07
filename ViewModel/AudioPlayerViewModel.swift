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
    var currentMusic = ""
    @Published var isPlaying = false

    private init() {
        if let sound = Bundle.main.path(forResource: self.getCurrentMusic(), ofType: "mp3") {
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
        } catch {
            print("AVAudioPlayer could not be instantiated.")
        }
        } else {
            print("Audio file could not be found.")
        }
    }
    
    func getCurrentMusic() -> String {
        return self.currentMusic
    }
    
    func setCurrentMusic(musicName: String) {
        self.currentMusic = musicName
    }
    
    func playNewMusic(musicName: String) {
        self.setCurrentMusic(musicName: musicName)
        // Update the audio player with the new music file
        if let sound = Bundle.main.path(forResource: musicName, ofType: "mp3") {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
                self.audioPlayer?.prepareToPlay()
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
}
