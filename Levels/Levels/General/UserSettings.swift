//
//  UserSettings.swift
//  Levels
//
//  Created by Maurice Salzmann on 22.10.23.
//

import Foundation
import SwiftUI

@Observable class UserSettings:Codable {
    static let shared = UserSettings()
    
    private var savedInstance: UserSettings? {
        get {
            let decoder = JSONDecoder()
            if let data = UserDefaults.standard.data(forKey: "userSettings"),
               let decoded = try? decoder.decode(UserSettings.self, from: data) {
                return decoded
            } else {
                return nil
            }
        }
        set {
            let encoder = JSONEncoder()
            if let newValue, let encoded = try? encoder.encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: "userSettings")
            } else {
                UserDefaults.standard.removeObject(forKey: "userSettings")
            }
        }
    }
    
    private init() {
        if let savedInstance {
            name = savedInstance.name
            nickName = savedInstance.nickName
            alwaysUseDarkMode = savedInstance.alwaysUseDarkMode
        }
    }
    

    var name = "" {
        didSet {
            savedInstance = self
        }
    }

    var nickName = "" {
        didSet {
            savedInstance = self
        }
    }

    var alwaysUseDarkMode = false {
        didSet {
            savedInstance = self
        }
    }
}
