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
            // TODO:
            // Check if there is data in the UserDefaults.
            // If yes, try to decode it using a JSONDecoder and return the resulting UserSettings object.
            // If no, return nil.
            return nil
        }
        set {
            // TODO:
            // Check if the newValue is nil.
            // If yes, remove the stored object from UserDefaults.
            // If no, use a JSONEncoder to encode the newValue to data and store the result in UserDefaults.
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
