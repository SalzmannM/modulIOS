//
//  TextLevelView.swift
//  Levels
//
//  Created by Nicolas Märki on 13.07.23.
//

import SwiftUI

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
        List {
            Text("Ich habe Städte, aber keine Häuser. Ich habe Wälder, aber keine Bäume. Ich habe Flüsse, aber kein Wasser. Was bin ich?")

            TextField("Antwort", text: $answer)

            if answer == "Karte" {
                Text("Korrekt")
            }
            else if !answer.isEmpty {
                Text("Falsch")
            }
        }
        .onChange(of: answer, { _, newValue in
            if newValue == "Karte" {
                levelState.success()
            }
        })
    }
}

#Preview {
    NavigationView {
        TextLevelView()
            .environment(LevelState())
    }
}
