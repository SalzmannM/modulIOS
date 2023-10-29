//
//  LevelAttemptDetailsView.swift
//  Levels
//
//  Created by Matthias Felix on 15.10.2023.
//

import SwiftUI
import SwiftData
import Charts

struct LevelAttemptDetailsView: View {
    let level: Level

    @Query private var attempts: [LevelAttempt]

    private var successfulAttempts: [LevelAttempt] {
        attempts.filter { $0.isSuccess }
    }

    private var failedAttempts: [LevelAttempt] {
        attempts.filter { !$0.isSuccess }
    }

    init(level: Level) {
        self.level = level
        let id = level.id
        _attempts = Query(filter: #Predicate<LevelAttempt> {$0.levelId == id}, sort: \.startTime)
    }

    var body: some View {
        if let firstAttempt = attempts.first {
            Text("Zuerst gelöst am: ")
                .bold()
                .padding(.top, 5)
            Text(firstAttempt.startTime, format: Date.FormatStyle(date: .abbreviated, time: .shortened))
        }
        Text("Versuche")
            .font(.headline)
            .padding(.top, 5)
        Chart {
            SectorMark(angle: .value("Erfolgreich", successfulAttempts.count),
                       innerRadius: .ratio(0.35),
                       angularInset: 2)
            .foregroundStyle(Color.green)
            .cornerRadius(5)
            .annotation(position: .overlay) {
                Text("\(successfulAttempts.count)")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            SectorMark(angle: .value("Fehlgeschlagen", failedAttempts.count),
                       innerRadius: .ratio(0.35),
                       angularInset: 2)
            .foregroundStyle(Color.red)
            .cornerRadius(5)
            .annotation(position: .overlay) {
                Text("\(failedAttempts.count)")
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
        .chartLegend(position: .trailing)
        .chartForegroundStyleScale(["Erfolgreich": Color.green, "Nicht erfolgreich": Color.red])
    }
}

#Preview {
    LevelAttemptDetailsView(level: textLevel)
}
