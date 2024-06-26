//
//  AudioPlayerViewModel.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 07/06/2024.
//

import Foundation
import AVFoundation

class AudioPlayerViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate {
    static let shared = AudioPlayerViewModel()
    var audioPlayer: AVAudioPlayer?
    var currentSong: Song = songs[Int.random(in: 1..<songs.count)]
    var selectedAlbum: Album = albums[Int.random(in: 1..<albums.count)]
    var selectedArtist: Artist = artists[Int.random(in: 1..<artists.count)]
    @Published var isPlaying = false
    @Published var currentTime: TimeInterval = 0
    @Published var duration: TimeInterval = 0

    override init() {
        super.init()
        if let sound = Bundle.main.path(forResource: getCurrentSong().title, ofType: "mp3") {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
                self.audioPlayer?.delegate = self
                self.duration = self.audioPlayer?.duration ?? 0
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    if self.audioPlayer?.isPlaying == true {
                        self.currentTime = self.audioPlayer?.currentTime ?? 0
                    }
                }
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
                                      
    func getSelectedAlbum() -> Album {
        return self.selectedAlbum
    }

    func setSelectedAlbum(album: Album) {
        self.selectedAlbum = album
    }
    
    func getSelectedArtist() -> Artist {
        return self.selectedArtist
    }

    func setSelectedArtist(artist: Artist) {
        self.selectedArtist = artist
    }

    func playNewSong(song: Song) {
        self.setCurrentSong(song: song)
        // Update the audio player with the new music file
        if let sound = Bundle.main.path(forResource: getCurrentSong().title, ofType: "mp3") {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
                self.audioPlayer?.delegate = self
                self.audioPlayer?.prepareToPlay()
                self.duration = self.audioPlayer?.duration ?? 0
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

    func updateCurrentTime(to time: TimeInterval) {
        audioPlayer?.currentTime = time
    }

    // AVAudioPlayerDelegate method
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playNextMusic()
    }
}
