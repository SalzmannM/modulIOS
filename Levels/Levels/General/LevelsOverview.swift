//
//  LevelsOverview.swift
//  Levels
//
//  Created by Maurice Salzmann on 22.10.23.
//

import SwiftUI

struct LevelsOverview: View {
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
