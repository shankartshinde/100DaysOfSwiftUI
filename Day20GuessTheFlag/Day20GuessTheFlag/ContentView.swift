//
//  ContentView.swift
//  Day20GuessTheFlag
//
//  Created by Shankar Tukaram on 10/14/19.
//  Copyright © 2019 Shankar Tukaram. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var userName = ""
    @State private var isShowAlert = false
    @State private var scoreTitle = ""
    @State private var  playerScore = 0
    @State private var  attempt = 0
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)

    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(Edge.Set.all)
            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            //RadialGradient(gradient: Gradient(colors: [.white,.gray,.blue]), center: .center, startRadius: 10, endRadius: 100)
//            AngularGradient(gradient: Gradient(colors: [.white,.gray,.blue]), center: .center)
//            , startAngle: 10, endAngle: 60)
            
            VStack(spacing:20.0) {
                VStack()  {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .bold()
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                        self.isShowAlert = true
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                
                Text("Your current score is \(playerScore)")
                    .foregroundColor(Color.white)
                    .font(.title)
                
                Spacer()
            }
        }
//        .alert(isPresented: $isShowAlert) {
//            //Alert(title: Text(scoreTitle), message: Text("Your scrore is ???"), dismissButton: .destructive(Text("Ok")))
//        }
            .alert(isPresented: $isShowAlert) { () -> Alert in
                Alert(title: Text(scoreTitle), message: Text("Your scrore \(playerScore)"), dismissButton: .default(Text("Continue"), action: {
                    self.askQuestion()
                }))
        }
    }
    
    func flagTapped(_ number:Int) {
        if correctAnswer == number {
            scoreTitle = "Correct"
            playerScore = playerScore + 1
        } else {
            scoreTitle = "Wrong! That’s the flag of \(countries[number])"
        }
    }
    
    func askQuestion() {
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0..<2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
