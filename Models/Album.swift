//
//  Album.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 15/05/2024.
//

import Foundation

struct Album: Identifiable, Equatable {
    var id = UUID()
    var image: String
    var title: String
    var subTitle: String
    var artist: Artist
}

let albums: [Album] = [
    Album(image: "https://i.postimg.cc/hGFHpSvF/FEU.jpg", title: "Feu", subTitle: "Nekfeu", artist: artists[0]),
    Album(image: "https://i.postimg.cc/mg1vYcbN/IGOR.jpg", title: "IGOR", subTitle: "Tyler, The Creator", artist: artists[1]),
    Album(image: "https://i.postimg.cc/FRp8r3Zm/NEVERMIND.avif", title: "Nevermind", subTitle: "Nirvana", artist: artists[2]),
    Album(image: "https://i.postimg.cc/vHKRx7dZ/RAM.jpg", title: "Random Access Memories", subTitle: "Daft Punk", artist: artists[3]),
    Album(image: "https://i.postimg.cc/BvxRzdPj/THRILLER.jpg", title: "Thriller", subTitle: "Michael Jackson", artist: artists[4]),
    Album(image: "https://i.postimg.cc/cH0PGXfX/TOTO.jpg", title: "Toto IV", subTitle: "Toto", artist: artists[5])
]
