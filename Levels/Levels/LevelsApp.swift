//
//  LevelsApp.swift
//  Levels
//
//  Created by Maurice Salzmann on 24.09.23.
//

import SwiftUI

@main
struct LevelsApp: App {
    @State private var userSettings: UserSettings = UserSettings.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(userSettings)
                .preferredColorScheme(userSettings.alwaysUseDarkMode ? .dark : nil)
        }
    }
}
