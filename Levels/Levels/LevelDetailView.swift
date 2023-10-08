//
//  LevelDetailView.swift
//  Levels
//
//  Created by Maurice Salzmann on 24.09.23.
//

import SwiftUI

struct LevelDetailView: View {
    @State var showLevel:Bool = false
    var body: some View {
        ScrollView {
            Image(ImageResource.level)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, minHeight: 0)
                .clipped()
                .aspectRatio(2, contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.3), radius: 5)
                .padding()
            HStack {
                VStack {
                    Text("Solved")
                        .font(.caption)
                    Text("25")
                        .font(.title2.bold())
                }
                VStack {
                    Text("Failed")
                        .font(.caption)
                    Text("9")
                        .font(.title2.bold())
                }
                Spacer()
                VStack {
                    Image(systemName: "heart")
                        .font(.title2)
                    Text("8")
                        .font(.caption)
                }
            }
            .padding()
            VStack {
                Button {
                    showLevel = true
                } label: {
                    Image(systemName: "play")
                        .font(.title2)
                    Text("Level starten")
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            VStack {
                Text("Das erste Rästel")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.top,.leading])
                Text("Hier wird eine kurze Beschreibung stehen. Fürs erste ist es bloss Text.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading])
                Text("Von **Maurice**")
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading,.bottom])
            }
            .background(Material.regular)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .black.opacity(0.3), radius: 5)
            .padding()
        }
        .background {
            Image(ImageResource.level)
                .blur(radius: 20)
                .opacity(0.2)
        }
        .fullScreenCover(isPresented: $showLevel) {
            HangmanLevelView(showLevel: $showLevel)
        }
    }
}
    

struct LevelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LevelDetailView()
    }
}
