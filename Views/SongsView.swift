//
//  SongsView.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 16/05/2024.
//

import SwiftUI

struct SongsView: View {
    var body: some View {
        List(songs) { song in
            SongCell(song: song)
                .listRowSeparator(.visible, edges: .top)
        }.listStyle(.plain)
    }
}

#Preview {
    SongsView()
}
