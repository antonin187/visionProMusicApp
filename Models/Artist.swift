//
//  Artist.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 16/05/2024.
//

import Foundation


struct Artist: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var image: String?
    
}

let artists: [Artist] = [
    Artist(name: "Nekfeu", image: "https://i.postimg.cc/xTh5SD8j/NEKFEU.png"),
    Artist(name: "Tyler, The Creator", image: "https://i.postimg.cc/g0qHRxDr/TYLER.png"),
    Artist(name: "Nirvana", image: "https://i.postimg.cc/L4yvNZM1/NIRVANA.png"),
    Artist(name: "Daft Punk", image: "https://i.postimg.cc/SNJd5Nyt/DAFTPUNK.png"),
    Artist(name: "Michael Jackson", image: "https://i.postimg.cc/sgWcj6GY/JACKSON.png"),
    Artist(name: "Toto", image: "https://i.postimg.cc/KYy5RPtd/TOTO.png"),
]

let featuringArtists: [Artist] = [
    Artist(name: "Pharell Williams"),
    Artist(name: "Nile Rodgers"),
    Artist(name: "Nemir"),
    Artist(name: "S.Pri Noir"),
]
