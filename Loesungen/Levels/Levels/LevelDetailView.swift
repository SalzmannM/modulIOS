//
//  LevelDetailView.swift
//  Levels
//
//  Created by Nicolas Märki on 16.09.23.
//

import SwiftUI

struct LevelDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
            Image(ImageResource.level)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, minHeight: 0)
                .clipped()
                .aspectRatio(2, contentMode: .fill)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()

                HStack {
                    VStack {
                        Text("Solved")
                        Text("25").font(.title.bold())
                    }
                    VStack {
                        Text("Failed")
                        Text("9").font(.title.bold())
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "heart").font(.title)
                        Text("8")
                    }
                }.padding()

                VStack(alignment: .leading) {
                    Text("Das erste Rätsel")
                        .font(.title)
                    Text("Hier wird eine kurze Beschreibung stehen. Fürs erste ist es bloss Text.")
                    (Text("Von ") + Text("Nicolas").bold()).font(.caption)
                }.padding()
                .background(Material.regular)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.3), radius: 5)
                .padding()
            }
        }
        .background {
            Image(ImageResource.level)
                .blur(radius: 20)
                .opacity(0.2)
        }

    }
}

#Preview {
    LevelDetailView()
}
