//
//  HangmanLevelView.swift
//  Levels
//
//  Created by Matthias Felix on 22.09.2023.
//

import SwiftUI

let hangmanLevel = Level(id: "levels.salzmann.hangman",
                         title: "Das Hangman-Level",
                         author: "Maurice",
                         description: "Spielerisches Rätsel, dass Wissen und Experimentiergeist verlangt.",
                         titleImage: Image(ImageResource.level),
                         view: HangmanLevelView())

private let asciiHangman = [
        """
           +-------+
           |
           |
           |
           |
           |
        ==============
        """
        ,
        """
           +-------+
           |       |
           |
           |
           |
           |
        ==============
        """
        ,
        """
           +-------+
           |       |
           |       0
           |
           |
           |
        ==============
        """
        ,
        """
           +-------+
           |       |
           |       0
           |       |
           |
           |
        ==============
        """
        ,
        """
           +-------+
           |       |
           |       0
           |      -|
           |
           |
        ==============
        """
        ,
        """
           +-------+
           |       |
           |       0
           |      -|-
           |
           |
        ==============
        """
        ,
        """
           +-------+
           |       |
           |       0
           |      -|-
           |      /
           |
        ==============
        """
        ,
        """
           +-------+
           |       |
           |       0
           |      -|-
           |      / \\
           |
        ==============
        """]

private let wordList = [
    "Blumen",
    "Drache",
    "Ernten",
    "Fallen",
    "Felsen",
    "Ferien",
    "Fische",
    "Fliege",
    "Gabeln",
    "Galgen",
    "Garage",
    "Gebote",
    "Kissen",
    "Kugeln",
    "Lachen",
    "Laufen",
    "Mutter",
    "Narren",
    "Orange",
    "Palast",
    "Pfanne",
    "Planen",
    "Quelle",
    "Sonnen",
    "Steuer",
    "Teller",
    "Wasser",
    "Wolken",
]

struct HangmanLevelView: View {
    @Environment(\.dismiss) private var dismiss 
    
    @State var remainingTries:Int = 7
    @State var guessedLetters:Set<Character> = []
    @State var text:String = ""
    
    private let wordToGuess: [Character] = wordList.randomElement()!.uppercased().map { $0 }
    
    var calculatedWord:[Character] {
        var guessedWord:[Character] = []
        for char in wordToGuess {
            if (guessedLetters.contains(char)) {
                guessedWord.append(char)
            } else {
                guessedWord.append("_")
            }
        }
        return guessedWord
    }
    
    func evaluateGuess() {
        var char:Character
        if (text.first != nil && remainingTries > 0 && wordToGuess != calculatedWord) {
            char = text.first!
        } else {
            char = "?"
        }
        if (char != "?" && !guessedLetters.contains(char) && !wordToGuess.contains(char)) {
            remainingTries -= 1
        }
        if (char != "?") {
            guessedLetters.insert(char)
        }
        text = ""
    }

    var body: some View {
        VStack {
            Text("Hangman")
                .font(.largeTitle)
                .padding(.bottom, 30)
            Text(asciiHangman[7-remainingTries])
                .font(.title)
                .monospaced()
                .padding(5)
                .background(Material.regular)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.3), radius: 5)
            VStack {
                Text("Verbleibende Versuche: \(remainingTries)")
                Text("Bereits geraten: \(guessedLetters.map{ "\($0)" }.joined(separator: " "))")
                if wordToGuess == calculatedWord {
                    Text( "Geschafft, bravo!")
                        .foregroundStyle(.green)
                } else if remainingTries == 0 {
                    Text( "Leider nicht geschafft... \n Gesuchtes Wort: \(wordToGuess.map{ "\($0)" }.joined(separator: " "))")
                        .foregroundStyle(.red)
                }
            }
            .padding(5)
            .background(Material.regular)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .black.opacity(0.3), radius: 5)
            
            HStack {
                ForEach(Array(calculatedWord.enumerated()), id: \.offset) {
                    idx, c in
                    if c == "_"{
                        Text(String(c))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .border(Color.red)
                    } else {
                        Text(String(c))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .border(Color.green)
                    }
                }
            }
            HStack {
                Text("Buchstabe: ")
                TextField("", text: $text)
                    .border(Color.gray)
                Button("Raten", action: evaluateGuess)
            }
            Spacer()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .toolbar {
            Button("Schliessen") {
                dismiss()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            .padding(.trailing, 8)
        }
    }
}

#Preview {
    NavigationView {
        HangmanLevelView()
    }
}
