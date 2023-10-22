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
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 200))]) {
                    ForEach(allLevels) {
                        level in
                        NavigationLink {
                            LevelDetailView(level: level)
                        } label: {
                            LevelsOverviewItemView(level: level)
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
