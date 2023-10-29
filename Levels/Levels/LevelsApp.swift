//
//  LevelsApp.swift
//  Levels
//
//  Created by Maurice Salzmann on 24.09.23.
//

import SwiftUI
import SwiftData

@main
struct LevelsApp: App {
    @State private var userSettings: UserSettings = UserSettings.shared
    @State private var levelState = LevelState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(userSettings)
                .environment(levelState)
                .preferredColorScheme(userSettings.alwaysUseDarkMode ? .dark : nil)
                .modelContainer(SwiftDataManager.shared.modelContainer)
        }
    }
}
