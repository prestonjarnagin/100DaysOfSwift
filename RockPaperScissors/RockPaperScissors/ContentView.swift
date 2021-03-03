//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Preston Jarnagin on 3/2/21.
//

import SwiftUI

let selections = ["rock", "paper", "scissors"]

struct ContentView: View {
    @State private var shouldWin = Bool.random()
    @State private var currentComputerSelection = selections.randomElement()!
    @State private var currentRound = 0
    @State private var currentScore = 0
    @State private var isShowingOutcomeOfGuess = false
    @State private var displayedOutcome = false
    
    var body: some View {
        VStack {

            Spacer()
            
            Text("Which \(shouldWin ? "wins" : "loses") aginst \(currentComputerSelection)?")
            
            Spacer()
            
            ForEach(selections, id: \.self) { selection in
                Button(action: { processAnswer(selection) }) { Text(selection.capitalized) }
                    .frame(minWidth: 120)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(3.0)
                    .padding([.top, .bottom], 10)
            }
            
            Spacer()
            Spacer()
            Spacer()
            Text("Current Round: \(currentRound)/10")
            Text("Score: \(currentScore)")
            Spacer()
        }.alert(isPresented: $isShowingOutcomeOfGuess) {
            Alert(
                title: Text(displayedOutcome ? "Correct":"Not Quite"),
                dismissButton: .default(Text("Continue"))
            )
        }
    }
    
    func processAnswer(_ selected: String) {
        
        if selected == currentComputerSelection {
            processIncorrectAnswer()
        } else {
            var didWin = false
            
            switch currentComputerSelection {
            case "rock":
                didWin = (selected == "paper")
            case "paper":
                didWin = (selected == "scissors")
            case "scissors":
                didWin = (selected == "rock")
            default:
                didWin = false
            }
            
            if shouldWin == didWin {
                processCorrectAnswer()
            } else {
                processIncorrectAnswer()
            }
        }
        isShowingOutcomeOfGuess = true
        buildNewRound()
    }
    
    func processCorrectAnswer() {
        print("Correct")
        displayedOutcome = true
        
        currentScore += 1
    }
    
    func processIncorrectAnswer() {
        displayedOutcome = false
        print("Incorrect")
    }
    
    func buildNewRound() {
        if currentRound == 10 {
            print ("Game Over")
        } else {
            shouldWin = Bool.random()
            currentComputerSelection = selections.randomElement()!
            currentRound += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
