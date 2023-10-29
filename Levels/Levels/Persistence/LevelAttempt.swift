//
//  LevelAttempt.swift
//  Levels
//
//  Created by Matthias Felix on 14.10.2023.
//

import Foundation
import SwiftData

@Model
class LevelAttempt {
    var levelId: String
    var isSuccess: Bool
    var startTime: Date
    var time: TimeInterval
    var highscore: Int?

    init(levelId: String, isSuccess: Bool, startTime: Date, time: TimeInterval, highscore: Int? = nil) {
        self.levelId = levelId
        self.isSuccess = isSuccess
        self.startTime = startTime
        self.time = time
        self.highscore = highscore
    }
}
