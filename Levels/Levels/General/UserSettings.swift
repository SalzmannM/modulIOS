//
//  UserSettings.swift
//  Levels
//
//  Created by Maurice Salzmann on 22.10.23.
//

import Foundation
import SwiftUI

@Observable class UserSettings {
    static let shared = UserSettings()
    
    private init() {}
    
    var name: String = ""
    var nickName: String = ""
    var alwaysUseDarkMode: Bool = false
}
