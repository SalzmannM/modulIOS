//
//  LevelDetailView.swift
//  Levels
//
//  Created by Maurice Salzmann on 24.09.23.
//

import SwiftUI
import Charts
import SwiftData

struct LevelDetailView: View {
    @Environment(LevelState.self) private var levelState
    
    let level:Level
    
    var body: some View {
        @Bindable var levelState = levelState

        ScrollView {
            level.titleImage
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
                    levelState.startLevel(level)
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
                Text(level.title)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.top,.leading])
                Text(level.description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading])
                Text("Von **\(level.author)**")
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading,.bottom])
                LevelAttemptDetailsView(level: level)
            }
            .background(Material.regular)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .black.opacity(0.3), radius: 5)
            .padding()
        }
        .background {
            level.titleImage
                .blur(radius: 20)
                .opacity(0.2)
        }
        .navigationTitle(level.title)
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(item: $levelState.currentLevel) { level in
            NavigationStack {
               AnyView(erasing: level.view)
                    .toolbar {
                        Button("Abbrechen") {
                            levelState.failureOrCancel()
                        }
                    }
           }
        }
    }
}
    

struct LevelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LevelDetailView(level: textLevel)
            .environment(LevelState())
            .modelContainer(SwiftDataManager.shared.modelContainer)
    }
}
