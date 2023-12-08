//
//  RankingPlayerView.swift
//  Levels
//
//  Created by Maurice Salzmann on 24.09.23.
//

import SwiftUI

struct RankingPlayerView: View {
    let player: Player
    var body: some View {
        HStack {
            AsyncImage(url: player.imageURL) { image in
                image.resizable()
                    .frame(width: 70, height: 70)
            } placeholder: {
                Rectangle()
                    .foregroundStyle(Color.gray)
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
            }
            .shadow(radius: 10)
            VStack {
                Text(player.name)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                if player.isSelf {
                    Image(systemName: "person")
                }
                Text(player.nickname)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            Spacer ()
            Text(String(player.score))
        }
    }
}

struct RankingPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        RankingPlayerView(
            player: .init(
                name: "Maurice",
                nickname: "Ich",
                score: 900,
                id: UUID(uuidString: "d7fb3660-7e77-428d-9152-d6e5a7107f09")!
            )
        )
    }
}
