//
//  Album.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 15/05/2024.
//

import Foundation

struct Album: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var subTitle: String
}

let albums: [Album] = [
    Album(image: "https://i.postimg.cc/hGFHpSvF/FEU.jpg", title: "Feu", subTitle: "Nekfeu"),
    Album(image: "https://i.postimg.cc/mg1vYcbN/IGOR.jpg", title: "IGOR", subTitle: "Tyler, The Creator"),
    Album(image: "https://i.postimg.cc/FRp8r3Zm/NEVERMIND.avif", title: "Nevermind", subTitle: "Nirvana"),
    Album(image: "https://i.postimg.cc/vHKRx7dZ/RAM.jpg", title: "Random Access Memory", subTitle: "Daft Punk"),
    Album(image: "https://i.postimg.cc/BvxRzdPj/THRILLER.jpg", title: "Thriller", subTitle: "Michael Jackson"),
    Album(image: "https://i.postimg.cc/cH0PGXfX/TOTO.jpg", title: "Toto IV", subTitle: "Toto")
]
