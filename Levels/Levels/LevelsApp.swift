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
    
    @State private var swiftDataManager: SwiftDataManager = SwiftDataManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(userSettings)
                .preferredColorScheme(userSettings.alwaysUseDarkMode ? .dark : nil)
                .modelContainer(
                    for: LevelAttempt.self
                )
                .environment(levelState)
        }
    }
}
