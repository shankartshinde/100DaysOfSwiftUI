//
//  ContentView.swift
//  CheckSplit
//
//  Created by Shankar Tukaram on 10/12/19.
//  Copyright © 2019 Shankar Tukaram. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    let percentage = [0,5,10,15,20,25]
    
    var grandTotal: Double {
        let orderAmount = Double(checkAmount) ?? 0
        let tipSelection = Double(percentage[tipPercentage])
        let totalTip = orderAmount * tipSelection * 0.01
        let total = orderAmount + totalTip
        return total
    }
    
    var totalPerPerson : Double {
        let orderAmount = Double(checkAmount) ?? 0
        let peopelCount = Double(numberOfPeople)
        let tipSelection = Double(percentage[tipPercentage])
        let totalTip = orderAmount * tipSelection * 0.01
        let grandTotal = orderAmount + totalTip
        let amountPerPerson = grandTotal/peopelCount

        return amountPerPerson
    }
    
    // Day 23 Challenge
    // Go back to project 1 and use a conditional modifier to change the total amount text view to red if the user selects a 0% tip.

    var isTipSelected : Bool {
        return tipPercentage == 0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    /*
                    Picker("Number of people ", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) { value in
                            Text("\(value - 2) people")
                        }
                    }
                    */
                    Picker("Number of people ", selection: $numberOfPeople) {
                        ForEach((1...100), id: \.self) { value in
                            Text("\(value) people")
                        }
                    }

                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<percentage.count) {
                            Text("\(self.percentage[$0])%")
                        }
                    }
                    //.pickerStyle(DefaultPickerStyle())
                    //.pickerStyle(WheelPickerStyle())
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header:Text("Grand Total")) {
                    Text("$\(grandTotal,specifier: "%.2f") ")
                        .foregroundColor(tipPercentage != 0 ? .black : .red)
                }

                Section(header:Text("Amount per person")) {
                    Text("$\(totalPerPerson,specifier: "%.2f") ")
                        //.foregroundColor(tipPercentage != 0 ? .black : .red)
                        .foregroundColor(isTipSelected ? .red : .black)
                }
            }
            .navigationBarTitle(Text("Check Split"), displayMode: NavigationBarItem.TitleDisplayMode.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
