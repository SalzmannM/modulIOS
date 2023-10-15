//
//  RankingListView.swift
//  Levels
//
//  Created by Maurice Salzmann on 24.09.23.
//

import SwiftUI

struct RankingListView: View {
    var body: some View {
        List {
            RankingPlayerView(firstName: "Maurice", codeName: "El Presidente", score: "1000")
            RankingPlayerView(firstName: "Sepp", codeName: "El Capo", score: "900")
            RankingPlayerView(firstName: "Anton", codeName: "El Tony", score: "1100")
        }
    }
}

struct RankingListView_Previews: PreviewProvider {
    static var previews: some View {
        RankingListView()
    }
}
