//
//  RankingPlayerView.swift
//  Levels
//
//  Created by Maurice Salzmann on 24.09.23.
//

import SwiftUI

struct RankingPlayerView: View {
    let firstName: String
    let codeName: String
    let score: String
    var body: some View {
        HStack {
            Image(ImageResource.player)
                .clipShape(Circle())
                .shadow(radius: 5)
            VStack {
                Text(firstName)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(codeName)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            Spacer ()
            Text(score)
        }
    }
}

struct RankingPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        RankingPlayerView(firstName: "Maurice", codeName: "El Presidente", score: "100")
    }
}
