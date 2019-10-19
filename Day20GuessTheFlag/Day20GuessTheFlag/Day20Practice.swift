//
//  Day20Practice.swift
//  Day20GuessTheFlag
//
//  Created by Shankar Tukaram on 10/17/19.
//  Copyright © 2019 Shankar Tukaram. All rights reserved.
//

import Foundation
import SwiftUI

struct PracticeSession:View  {
    @State private var userName = ""
    @State private var isShowAlert = false

        var body: some View {
            // VStack and HStack-
            // 1. Stack takes maximum 10 elements, We can add more element using 'Group'
            // 2. Spacer allows to shift element
            /*
            VStack(alignment: .leading) {
                Group {
                Text("Hello World First")
                
                Text("Hello World Second")
                
                Text("Hello World First")
                
                Text("Hello World Second")

                Text("Hello World First")
                
                Text("Hello World Second")

                Text("Hello World First")
                
                Text("Hello World Second")

                Text("Hello World First")
                
                Text("Hello World Second")
                //Spacer()
                }
                
                Group {
                    Text("Second Group")
                //Text("Hello World First")
                
                Text("Hello World Second")
                
                Text("Hello World First")
                
                Text("Hello World Second")

                Text("Hello World First")
                
                Text("Hello World Second")

                Text("Hello World First")
                
                Text("Hello World Second")

                Text("Hello World First")
                
                Text("Hello World Second")
                //Spacer()
                }
            }
            */
            
            /*
            // ZStack - Doesn't have concept of spacing,It does have alignment
            ZStack(alignment: .bottomLeading) {
                Text("You are in the ZStack - First Element")
                Text("You are in the ZStack - Second Element")
            }
            */
            
            /*
            //Try placing several horizontal stacks inside a single vertical stack – can you make a 3x3 grid?
            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .center, spacing: 20) {
                    Color.yellow.frame(width: 100, height: 100, alignment: .leading)
                    Text("1")
                    Text("2")
                    Text("3")
                }
                HStack(alignment: .center, spacing: 20) {
                    Text("4")
                    Text("5")
                    Text("6")
                }.background(Color.green)

                HStack(alignment: .center, spacing: 20) {
                    Text("7")
                    Text("8")
                    Text("9")
                }
                HStack(alignment: .center, spacing: 20) {
                    Text("*")
                    Text("0")
                    Text("#")
                }
            }
            */
            
            /*
             // ZStack - One ZStack contains multiple ZStack,VStack,HStack still it overlap from top to bottom hierarchy
            ZStack(alignment: .leading) {
                // Still All Views get overlap on each other
                ZStack {
                    Color.blue.frame(width: 200, height: 200)
                    Text("*")
                }
                ZStack {
                    Color.yellow.frame(width: 200, height: 200)
                    Text("0")
                }

                ZStack {
                    Color.red.frame(width: 200, height: 200)
                    Text("#")
                }

    //            Color.blue.frame(width: 200, height: 200)
    //            Text("*")
    //            Text("0")
    //            Text("#")
            }
            */
            
            /*
            ZStack {
                Color.red.edgesIgnoringSafeArea(.all)
                Text("Your content")
            }
            */
            
            /*
             // Graident in Swift - Linear, Radial,
            //LinearGradient(gradient: Gradient(colors: [.green,.orange]), startPoint: UnitPoint(x:80 , y: 100), endPoint: UnitPoint(x: 200, y:300))
            VStack {
            LinearGradient(gradient: Gradient(colors: [.pink,.purple,.yellow]), startPoint: .top, endPoint: .center)

            LinearGradient(gradient: Gradient(colors: [.black,.green]), startPoint: .bottomLeading, endPoint: .bottomTrailing)
            LinearGradient(gradient: Gradient(colors: [.black,.green]), startPoint: .bottomTrailing, endPoint: .bottomLeading)
            }
            */

            /*
             
            Text("My Graident Text View")
                .frame(width: 300, height: 100, alignment: .top)
                .background(LinearGradient(gradient: Gradient(colors: [.pink,.purple,.yellow]), startPoint: .top, endPoint: .center))
            //AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
             */
            
            /*
             Buttons and images
             // Example 1
                Button(action: {
                    print("You clicked ")
                }) { //() -> PrimitiveButtonStyleConfiguration.Label in
                    HStack(spacing: 10) {
                        Image(systemName: "pencil")
                        Text("Edit")
                    }
                }
             // Example 2
                 Button(action: {
                     print(" On click Change state of app")
                 }) {
                     Text("Tap Here")
                 }

             */
            
            //Alert(title: Text("Warning : This message belong to warning"))
    //        Alert(title: Text("Warning"), message: Text("Would you like to continue for payment"), primaryButton: Button("Ok", action: {
    //            print("Ok is clicked")
    //        }), secondaryButton: Button("Cancel", action: {
    //            print("Cancel is clicked")
    //        }))

            //Alert(title: Text("Error"), message: Text("Please check internet connection "), dismissButton: .default(Text("OK")))
            
            Button.init("Show Alert") {
                self.isShowAlert = true
            }.alert(isPresented: $isShowAlert) { () -> Alert in
                Alert(title: Text("Error"), message: Text("Please check internet connection "), dismissButton:
                    .default(Text("Ok")))
                    //.destructive(Text("Ok")))
            }
            
        }
}
