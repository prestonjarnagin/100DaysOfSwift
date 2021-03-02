//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Preston Jarnagin on 3/2/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: { print("ONE") }) { Text("Rock") }
            Button(action: { print("ONE") }) { Text("Paper") }
            Button(action: { print("ONE") }) { Text("Scissors") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
