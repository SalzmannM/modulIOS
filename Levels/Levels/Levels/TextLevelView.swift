//
//  TextLevelView.swift
//  Levels
//
//  Created by Nicolas Märki on 13.07.23.
//

import SwiftUI
import SwiftData
import Foundation

let textLevel = Level(id: "levels.maerki.text-quiz",
                      title: "Das Texträtsel",
                      author: "Nicolas",
                      description: "Besonders schwieriges Rätsel, dass viel Wissen, Erfindergeist und Geduld verlangt.",
                      titleImage: Image(ImageResource.levelImage2),
                      view: TextLevelView())

struct TextLevelView: View {
    @Environment(LevelState.self) private var levelState: LevelState

    @State var answer: String = ""
    var body: some View {
        @Bindable var levelState = levelState
        
        List {
            Text("Ich habe Städte, aber keine Häuser. Ich habe Wälder, aber keine Bäume. Ich habe Flüsse, aber kein Wasser. Was bin ich?")

            TextField("Antwort", text: $answer)

            if answer == "Karte" {
                levelState.success()
                Text("Korrekt")
            }
            else if !answer.isEmpty {
                levelState.failureOrCancel()
                Text("Falsch")
            }
        }
    }
}

#Preview {
    NavigationView {
        TextLevelView()
            .environment(LevelState())
    }
}
