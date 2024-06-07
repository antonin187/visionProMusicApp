//
//  ArtistsView.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 16/05/2024.
//

import SwiftUI

struct ArtistsView: View {
    @State private var searchText: String = ""
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 160, maximum: 200))]
    var body: some View {
        ScrollView {
            TextField("Search in Artists", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            
            LazyVGrid(columns: columns, spacing: 24) {
                ForEach(artists) { artist in
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        VStack (alignment: .center) {
                            AsyncImage(url: URL(string: artist.image ?? "")) { image in
                                image.resizable()
                            } placeholder: {
                                Rectangle().foregroundStyle(.tertiary)
                            }.aspectRatio(1, contentMode: .fill)
                                .scaledToFill()
                                .clipShape(Circle())
                            
                            Text(artist.name)
                                .font(.title2)
                                .fontWeight(.medium)
                                .lineLimit(1)
                        }
                        .hoverEffect()
                    }.buttonStyle(.plain)
                }
            }
        }.padding(.horizontal, 24)
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                VStack (alignment: .leading) {
                    Text("Artists")
                        .font(.largeTitle)
                    Text("\(artists.count) artists")
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
    ArtistsView()
}
