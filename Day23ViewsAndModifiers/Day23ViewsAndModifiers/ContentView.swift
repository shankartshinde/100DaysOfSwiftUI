//
//  ContentView.swift
//  Day23ViewsAndModifiers
//
//  Created by Shankar Tukaram on 10/19/19.
//  Copyright © 2019 Shankar Tukaram. All rights reserved.
//

import SwiftUI

struct CapsuleShapeText : View {
    var text:String
    var body : some View {
        Text(text)
            .font(.largeTitle)
           .padding()
           .foregroundColor(Color.red)
           .background(Color.blue)
           .clipShape(Capsule())
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct ContentView: View {
//    var body : Text {
//        Text("'Some' removed from View")
//    }
    
    @State private var userRedText = false
    
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    var motto3 : some View {
        Text("Hogwarts School")
    }
    
    let heros = ["APJ Abdul Kalam","C V Raman", "Homi Bhabha", "Vikaram Sarabhai", "Jayant Naralikar", "Raghunath Mashelkar", "Anil Kakodkar"]
    
    @State var simpleBinding: Int = 0 {
        didSet {
            print("Selection was changed to \(simpleBinding)")
        }
    }
    
    var computedProperty: Int {
       return 2 * simpleBinding
    }
    
    @State var customBinding = 0
    
    @State private var userAgreeTC = false
    @State private var userAgreePrivacy = false
    @State private var userAgreeEmailShipping = false
    @State private var isActiveContinueBtn = false
    
    var body: some View {
        
        let binding = Binding (
            get: { self.customBinding},
            set: { self.customBinding = $0}
        )
        
        let makeContinueBtnActive = Binding (
                get: {self.userAgreeTC && self.userAgreePrivacy && self.userAgreeEmailShipping },
                set: {
                    self.userAgreeTC = $0
                    self.userAgreePrivacy = $0
                    self.userAgreeEmailShipping = $0
            }
        )
        
        /*
        Text("Hello World")
            //.frame(width: 320, height: 500, alignment: .leading)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            //.frame(width: 200, height: 200, alignment: .bottom)
         */
        /* Modifier : ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Button<Text>, _BackgroundModifier<Color>>, _EnvironmentKeyWritingModifier<Optional<Color>>>, _EnvironmentKeyWritingModifier<Optional<Font>>>, _FrameLayout>
         Button("Hello Button") {
             //print("Button Tapped")
             print(type(of: self.body))
         }.background(Color.red)
             .foregroundColor(Color.white)
             .font(.largeTitle)
             .frame(width: 200, height: 200, alignment: .leading)
         */
        /*
        // Example of modifier content - How new view is generate after each modifier
         Text("Good Evening Friends")
         .padding()
             .background(Color.blue)
         .padding()
             .background(Color.red)
         .padding()
             .background(Color.yellow)
         .padding()
             .background(Color.green)
             .padding()
             .background(Color.orange)

         */
        
        /*  //Conditional modifier
        Button("Change the Button Color") {
            self.userRedText.toggle()
        }.foregroundColor(userRedText ? Color.red : Color.blue)
        
        */
        /*
         Modifier
        
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
                .blur(radius: 0)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
            .font(.title) // environment modifier
            .blur(radius: 2) // reguler modifier
        */

        /*
        // Views as properties
        
        VStack {
            motto1
                .foregroundColor(.red)
                .font(.headline)
            motto2
                .foregroundColor(.blue)
                .fontWeight(.medium)
            motto3
        }
         */
        
        /*
        //View composition
         */
        
        return Form {
            VStack(spacing:20) {
            
                /*
                Text("My First text line")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(Color.red)
                    .background(Color.blue)
                    .clipShape(Capsule())

                Text("My Second text line")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(Color.red)
                    .background(Color.blue)
                    .clipShape(Capsule())
                */
                CapsuleShapeText(text: "My First text line")
                CapsuleShapeText(text: "My Second text line")
                Text("Custom modifiers Example ")
                .modifier(Title())
                
                Text("Smart ways to create Custom modifier")
                .titleStyle()
                
                Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking with Swift")
                
                ForEach(0..<15) { number in
                    Text("Example of ForEach added text : \(number)")
                }.foregroundColor(.purple)
                    .font(.largeTitle)
                
                ForEach(heros, id: \.self) { scientist  in
                    Text(scientist)
                }
                
                Picker(selection: binding, label: Text("Custom Binding Picker Code")) {
                    ForEach(0..<3) {
                        Text("Item \($0)")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                Group {
                    Text("Selected Item is ")
                    Text("\(customBinding)")
                }
                
                Section(header: Text("We might represent that as three Boolean @State properties:")) {
                    Toggle("User agreed to the terms and conditions", isOn: $userAgreeTC)
                    Toggle("User agree to the privacy policy", isOn: $userAgreePrivacy)
                    Toggle("User agree to get emails about shipping", isOn: $userAgreeEmailShipping)
                    Toggle("Agree to all", isOn: makeContinueBtnActive)
//                    Button("Continue") {
//                        Text("It is enable -> User can perfrom next step" )
//                    }.disabled(isActiveContinueBtn)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
