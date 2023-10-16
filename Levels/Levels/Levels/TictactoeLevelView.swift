//
//  TictactoeLevelView.swift
//  Levels
//
//  Created by Maurice Salzmann on 15.10.23.
//

import SwiftUI

struct TictactoeLevelView: View {
    @Binding var showLevel:Bool
    
    @State var player:Character = "X"
    @State var score:Array<Character> = ["_", "_", "_", "_", "_", "_", "_", "_", "_"]
    
    var body: some View {
        Button {
            showLevel = false
        } label: {
            Text("Schliessen")
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
        .padding(.trailing, 8)
        
        Text("Tic-Tac-Toe")
            .font(.largeTitle)
            .padding(.bottom, 30)
        VStack {
            HStack {
                Button {
                    score[0] = player
                } label: {
                    Text(String(score[0]))
                }
            }
        }
    }
}

#Preview {
    TictactoeLevelView(showLevel: .constant(true))
}
