//
//  SideBarViews.swift
//  visionProMusicApp
//
//  Created by Antonin Simon on 15/05/2024.
//

import SwiftUI

struct SideBarView: View {
    @State private var showingAlert = false
    
    var body: some View {
        List (sideMenuItems) { item in
            NavigationLink(value: item) {
                Label(item.name, systemImage: item.icon)
                    .foregroundStyle(.primary)
            }.navigationDestination(for: SideMenuItem.self) { item in
                // Menu Item View
                switch item.name {
                case "Recently Added":
                    Text("Recently Added")
                case "Artists":
                    ArtistsView()
                case "Albums":
                    AlbumsView()
                case "Songs":
                    SongsView()
                case "Made For You":
                    Text("Made For You")
                default:
                    Text("Coming Soon!")
                    
                }
            }
        }.toolbar {
            ToolbarItem(placement: .topBarLeading) {
                VStack (alignment: .leading) {
                    Text("Library")
                        .font(.largeTitle)
                    Text("All Music")
                        .foregroundStyle(.tertiary)
                }
            }
            ToolbarItem {
                Menu {
                    Button {
                        showingAlert = true
                    } label: {
                        Label("J'aime l'application", systemImage: "heart.fill")
                    }
                } label: {
                    Label("Add New", systemImage: "ellipsis")
                }
            }
        }.alert("Antonin et Maxime te remercient !", isPresented: $showingAlert) {
            Button("Avec plaisir", role: .cancel) { }
        }
    }
}

#Preview(windowStyle: .automatic) {
    NavigationStack {
        SideBarView()
    }
}
