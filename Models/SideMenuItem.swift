//
//  SideMenuItem.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 15/05/2024.
//

import Foundation

struct SideMenuItem: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var icon: String
}

let sideMenuItems: [SideMenuItem] = [
    SideMenuItem(name: "Recently Added", icon: "clock"),
    SideMenuItem(name: "Artists", icon: "music.mic"),
    SideMenuItem(name: "Albums", icon: "square.stack"),
    SideMenuItem(name: "Songs", icon: "music.note"),
    SideMenuItem(name: "Genres", icon: "guitars"),
    SideMenuItem(name: "Composers", icon: "music.quarternote.3"),
    SideMenuItem(name: "Downloaded Music", icon: "arrow.down.circle"),
//    SideMenuItem(name: "Made For You", icon: "person.crop.square")
]
