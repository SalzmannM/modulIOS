//
//  Level.swift
//  Levels
//
//  Created by Matthias Felix on 29.09.2023.
//

import Foundation
import SwiftUI

struct Level: Identifiable {
    let id: String
    let title: String
    let author: String
    let description: String
    let titleImage: Image
    let view: any View
}

let allLevels: [Level] = [
    textLevel,
    toggleLevel,
    hangmanLevel,
    tictactoeLevel
]
