//
//  LevelsOverview.swift
//  Levels
//
//  Created by Maurice Salzmann on 22.10.23.
//

import SwiftUI
import SwiftData

struct LevelsOverview: View {
    @Query(filter: #Predicate<LevelAttempt> { $0.isSuccess }, sort: \.startTime, order: .reverse) private var successfulAttempts: [LevelAttempt]
    
    private var successfulLevelIds: Set<String> {
        Set(successfulAttempts.map { $0.levelId })
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 200))]) {
                    ForEach(allLevels) { level in
                        NavigationLink {
                            LevelDetailView(level: level)
                        } label: {
                            LevelsOverviewItemView(level: level)
                                .opacity(successfulLevelIds.contains(level.id) ? 0.5 : 1)
                        }
                    }
                }
            }
            .navigationTitle("Levels")
        }
    }
}

#Preview {
    LevelsOverview()
}
