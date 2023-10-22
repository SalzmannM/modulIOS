//
//  LevelsOverviewItemView.swift
//  Levels
//
//  Created by Maurice Salzmann on 22.10.23.
//

import SwiftUI

struct LevelsOverviewItemView: View {
    let level:Level
    
    var body: some View {
        VStack {
            level.titleImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.3), radius: 5)
                .padding()
            
            Text(level.title)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding([.top,.leading])
            
            Text("Von **\(level.author)**")
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding([.leading,.bottom])
        }
    }
}

#Preview {
    LevelsOverviewItemView(level: textLevel)
}
