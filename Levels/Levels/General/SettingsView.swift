//
//  SettingsView.swift
//  Levels
//
//  Created by Maurice Salzmann on 22.10.23.
//

import SwiftUI

struct SettingsView: View {
    @Environment(UserSettings.self) private var userSettings
    
    var body: some View {
        @Bindable var userSettings = userSettings
        
        NavigationStack {
            List {
                Section("User") {
                    TextField("Username", text: $userSettings.name)
                    TextField("Nickname", text: $userSettings.nickName)
                    
                    Button("Speichern") {
                        Task {
                            do {
                                try await Networking.shared.updateUser(name: userSettings.name, nickname: userSettings.nickName)
                            }
                            catch {
                                print("Failed to update user", error)
                            }
                        }
                    }
                }
                Section("Erscheinungsbild") {
                    Toggle(isOn: $userSettings.alwaysUseDarkMode, label: {
                        Text("Immer Dark Mode verwenden")
                    })
                }
            }
        }
        .navigationTitle("Einstellungen")
    }
}

#Preview {
    SettingsView()
        .environment(UserSettings.shared)
}
