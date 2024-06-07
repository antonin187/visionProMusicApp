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
                .listRowSeparator(.automatic)
        }.listStyle(.plain)
            .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                VStack (alignment: .leading) {
                    Text("Songs")
                        .font(.largeTitle)
                    Text("\(songs.count) songs")
                        .foregroundStyle(.tertiary)
                }
            }
            ToolbarItem {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "line.3.horizontal.decrease")
                }).buttonBorderShape(.circle)
            }
        }
    }
}

#Preview {
    SongsView()
}
