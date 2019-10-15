//
//  ContentView.swift
//  Day19
//
//  Created by Shankar Tukaram on 10/13/19.
//  Copyright © 2019 Shankar Tukaram. All rights reserved.
//

import SwiftUI


enum LenthUnit:String {
    case Kilometers = "Kilometers"
    case Feet = "Feet"
    case Yard = "Yard"
    case Miles = "Miles"
    case Centimeters = "Centimeters"
}


struct ContentView: View {
    @State private var userInputValue:String = ""
    @State private var targetUnitSelection = 0
    let units = ["Kilometers", "Feet", "Yard", "Miles","Centimeters"]
    var resultValue : Double {
        let meterValue = Double(userInputValue) ?? 0.0
        let resultUnitType = LenthUnit(rawValue: units[targetUnitSelection])
        switch resultUnitType {
        case .Kilometers:
            return meterValue / 1000
        case .Feet:
            return meterValue * 3.281
        case .Yard:
            return meterValue * 1.094
        case .Miles:
            return meterValue * 1609.344
        case .Centimeters:
            return meterValue * 100
        default:
            return 0.0
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter input value in meter")) {
                    TextField("Enter value for conversion", text: $userInputValue)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Choose destination unit")) {
                    Picker("Target conversion Unit", selection: $targetUnitSelection) {
                        ForEach(0 ..< units.count) { index in
                            Text("\(self.units[index])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }

//                Picker("Target conversion Unit", selection: $targetUnitSelection) {
//                    ForEach(0 ..< units.count) { index in
//                        Text("\(self.units[index])")
//                    }
//                }
                
                Section(header: Text("Final Conversion")) {
                    Text("\(userInputValue) Meters to \(units[targetUnitSelection]) is : \(resultValue,specifier: "%0.3f") ")
                }
            }
        .navigationBarTitle(LocalizedStringKey("Day19-LengthConversion"), displayMode: NavigationBarItem.TitleDisplayMode.inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
