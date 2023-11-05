//
//  RankingListView.swift
//  Levels
//
//  Created by Maurice Salzmann on 24.09.23.
//

import SwiftUI

struct RankingListView: View {
    @State var networking = Networking.shared
    @State var errorMessage: String?
    
    var body: some View {
        List {
            if let errorMessage {
                Label(errorMessage, systemImage: "exclamationmark.triangle")
            }
            else if let ranking = networking.ranking {
                Section {
                    ForEach(ranking.players){ player in
                        RankingPlayerView(player: player)
                    }
                }
            }
            else {
                ProgressView().progressViewStyle(.circular)
            }
        }
        .task {
            do {
                try await networking.loadRanking()
            }
            catch {
                errorMessage = error.localizedDescription
            }
        }
        .refreshable {
            do {
                try await networking.loadRanking()
            }
            catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}

struct RankingListView_Previews: PreviewProvider {
    static var previews: some View {
        RankingListView()
    }
}
