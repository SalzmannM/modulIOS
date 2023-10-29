//
//  ContentView.swift
//  Levels
//
//  Created by Maurice Salzmann on 24.09.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LevelsOverview()
                .tabItem {
                    Label("Levels", systemImage: "square.grid.3x2.fill")
                }
            RankingListView()
                .tabItem {
                    Label("Ranking", systemImage: "list.number")
                }
            SettingsView()
                .tabItem {
                    Label("Einstellungen", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(UserSettings.shared)
        .modelContainer(SwiftDataManager.shared.modelContainer)
}
