//
//  LevelState.swift
//  Levels
//
//  Created by Matthias Felix on 14.10.2023.
//

import Foundation

@Observable class LevelState {
    var currentLevel: Level?
    private var currentLevelStartTime: Date?

    func startLevel(_ level: Level) {
        currentLevel = level
        currentLevelStartTime = Date()
    }

    func success() {
        guard let currentLevel, let currentLevelStartTime else { return }

        let elapsedTime = Date().timeIntervalSince(currentLevelStartTime)

        Task {
            let attempt = LevelAttempt(levelId: currentLevel.id,
                                       isSuccess: true,
                                       startTime: currentLevelStartTime,
                                       time: elapsedTime)

            await SwiftDataManager.shared.saveNewAttempt(attempt)
        }

        self.currentLevel = nil
        self.currentLevelStartTime = nil
    }

    func failureOrCancel() {
        guard let currentLevel, let currentLevelStartTime else { return }

        let elapsedTime = Date().timeIntervalSince(currentLevelStartTime)

        Task {
            let attempt = LevelAttempt(levelId: currentLevel.id,
                                       isSuccess: false,
                                       startTime: currentLevelStartTime,
                                       time: elapsedTime)

            await SwiftDataManager.shared.saveNewAttempt(attempt)
        }

        self.currentLevel = nil
        self.currentLevelStartTime = nil
    }
}
