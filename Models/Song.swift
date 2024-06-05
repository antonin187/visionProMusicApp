//
//  Song.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 16/05/2024.
//

import Foundation

struct Song: Identifiable {
    var id = UUID()
    var title: String
    var album: Album
    var featurings: [Artist]
}

let songs: [Song] = [
    Song(title: "Tempête", album: albums[0], featurings: []),
    Song(title: "Martin Eden", album: albums[0], featurings: []),
    Song(title: "Le horla", album: albums[0], featurings: []),
    Song(title: "Egérie", album: albums[0], featurings: []),
    Song(title: "Ma dope", album: albums[0], featurings: []),
    Song(title: "Princesse", album: albums[0], featurings: []),
    
    
    Song(title: "IGOR'S THEME", album: albums[1], featurings: []),
    Song(title: "PUPPET", album: albums[1], featurings: []),
    Song(title: "WHAT'S GOOD", album: albums[1], featurings: []),
    Song(title: "NEW MAGIC WAND", album: albums[1], featurings: []),
    
    
    Song(title: "Smells Like Teen Spirit", album: albums[2], featurings: []),
    Song(title: "Come As You Are", album: albums[2], featurings: []),
    Song(title: "Breed", album: albums[2], featurings: []),
    Song(title: "Lithium", album: albums[2], featurings: []),
    Song(title: "Drain You", album: albums[2], featurings: []),
    Song(title: "Territorial Pissings", album: albums[2], featurings: []),
    Song(title: "Lounge Act", album: albums[2], featurings: []),
    
    
    Song(title: "Give Life Back to Music", album: albums[3], featurings: []),
    Song(title: "Within", album: albums[3], featurings: []),
    Song(title: "Get Lucky", album: albums[3], featurings: [featuringArtists[0], featuringArtists[1]]),
    Song(title: "Beyond", album: albums[3], featurings: []),
    Song(title: "Motherbàard", album: albums[3], featurings: []),
    
    
    Song(title: "Thriller", album: albums[4], featurings: []),
    Song(title: "Beat It", album: albums[4], featurings: []),
    Song(title: "Billie Jean", album: albums[4], featurings: []),
    Song(title: "Human Nature", album: albums[4], featurings: []),
    Song(title: "P.Y.T. (Pretty Young Thing)", album: albums[4], featurings: []),
    
    
    Song(title: "Rosana", album: albums[5], featurings: []),
    Song(title: "Afraid of Love", album: albums[5], featurings: []),
    Song(title: "Africa", album: albums[5], featurings: []),
]
