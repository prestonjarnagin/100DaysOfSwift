//
//  ContentView.swift
//  Conversion
//
//  Created by Preston Jarnagin on 2/15/21.
//

import SwiftUI

struct ContentView: View {
    @State private var valueToConvert = ""
    @State private var selectedInputUnit = 0
    @State private var selectedOutputUnit = 1
    
    var commonDistance: Double {
        return units[selectedInputUnit].convertToCommon(value: valueToConvert)
    }
    
    var converted: Double {
        return units[selectedOutputUnit].convertFromCommon(value: commonDistance)
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $valueToConvert)
                            .keyboardType(.decimalPad)
                    
                    Picker("Input Unit", selection: $selectedInputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(units[$0].name)")
                        }
                    }
                    
                    Picker("Output Unit", selection: $selectedOutputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(units[$0].name)")
                        }
                    }
                }
                
                Section(header: Text("Conversion"))
                {
                    Text("\(converted, specifier: "%.3f")")
                }
            }
            .navigationBarTitle(Text("Conversion"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Distance {
    var name: String

    func convertToCommon(value: String?) -> Double {
        let unwrapped = value ?? "0"
        let valueToConvert = Double(unwrapped) ?? 0
        
        switch self.name {
        case "meters":
            return valueToConvert
        case "kilometers":
            return valueToConvert * 1000
        case "feet":
            return valueToConvert * 0.3048
        case "yards":
            return valueToConvert * 0.9144
        case "miles":
            return valueToConvert * 1609.34
        default:
            return 0
        }
    }
    
    func convertFromCommon(value: Double) -> Double {
        switch self.name {
        case "meters":
            return value
        case "kilometers":
            return value * 0.001
        case "feet":
            return value * 3.28084
        case "yards":
            return value * 1.09361
        case "miles":
            return value * 0.000621371
        default:
            return 0
        }
    }
}

let units = [
    Distance(name: "meters"),
    Distance(name: "kilometers"),
    Distance(name: "feet"),
    Distance(name: "yards"),
    Distance(name: "miles")
]

