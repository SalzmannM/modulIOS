//
//  TictactoeLevelView.swift
//  Levels
//
//  Created by Maurice Salzmann on 15.10.23.
//

import SwiftUI

let tictactoeLevel = Level(id: "levels.salzmann.tictactoe",
                           title: "Tic-Tac-Toe",
                           author: "Maurice",
                           description: "Klassisches Tic-Tac-Toe Spiel zu Zweit",
                           titleImage: Image(ImageResource.levelImage4),
                           view: TictactoeLevelView())

struct TictactoeLevelView: View {
    @Environment(LevelState.self) private var levelState
    
    private let winningCoordinates = [
        // horizontal
        [(0, 0), (0, 1), (0, 2)],
        [(1, 0), (1, 1), (1, 2)],
        [(2, 0), (2, 1), (2, 2)],

        // vertical
        [(0, 0), (1, 0), (2, 0)],
        [(0, 1), (1, 1), (2, 1)],
        [(0, 2), (1, 2), (2, 2)],

        // diagonal
        [(0, 0), (1, 1), (2, 2)],
        [(0, 2), (1, 1), (2, 0)],
    ]
    
    @State var move:Int = 0
    
    @State var player:Character = "X"
    @State var winner:Character = "_"
    @State var score:Array<Array<Character>> = [
        ["_", "_", "_"],
        ["_", "_", "_"],
        ["_", "_", "_"]
    ]
    
    var body: some View {
        VStack {
            if move == 9 || winner != "_" {
                Text("Spiel ist zu Ende!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.black)
                    .transition(.move(edge: .leading).combined(with: .opacity))
            } else if player == "X" {
                Text("Spieler: **\(String(player))** ist am Zug")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.green)
                    .transition(.move(edge: .leading).combined(with: .opacity))
            } else if player == "O" {
                Text("Spieler: **\(String(player))** ist am Zug")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.blue)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }
            Grid {
                ForEach(0..<3) {
                    x in
                    GridRow {
                        ForEach(0..<3) {
                            y in
                            Color.black.opacity(0.1)
                                .aspectRatio(1, contentMode: .fit) // This makes the rectangle a square
                                .onTapGesture {
                                    if winner == "_" && score[x][y] == "_" {
                                        withAnimation {
                                            move += 1
                                            score[x][y] = player
                                            checkEnd()
                                            if winner == "_" &&  player == "X" {
                                                player = "O"
                                            }
                                            else if winner == "_" {
                                                player = "X"
                                            }
                                        }
                                    }
                                }
                                .border(.black)
                                .overlay {
                                    if score[x][y] == "X" {
                                        Text(String("X"))
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            .foregroundStyle(Color.green)
                                            .transition(.move(edge: .leading).combined(with: .opacity))
                                    } else if score[x][y] == "O" {
                                        Text(String("O"))
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            .foregroundStyle(Color.blue)
                                            .transition(.move(edge: .trailing).combined(with: .opacity))
                                    }
                                }
                        }
                    }
                }
            }
            
            if move == 9 && winner == "_" {
                Text("Spiel endet Unentschieden!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.black)
                    .transition(.move(edge: .leading).combined(with: .opacity))
                levelState.failureOrCancel()
            } else if winner == "X" {
                Text("Spieler: **\(String(winner))** hat gewonnen!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.green)
                    .transition(.move(edge: .leading).combined(with: .opacity))
                levelState.success()
            } else if winner == "O" {
                Text("Spieler: **\(String(winner))** hat gewonnen!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.blue)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                levelState.failureOrCancel()
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    private func checkEnd() {
        for coordinate in winningCoordinates {
            if coordinate.allSatisfy({
                score[$0.0][$0.1] == player
            }) {
                winner = player
            }
        }
    }
}

#Preview {
    TictactoeLevelView()
}
