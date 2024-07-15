//
//  ContentView.swift
//  UnitsConversor
//
//  Created by Enzo Ficoseco on 15/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputNumber = 0.0
    @State private var inputUnit = "meters"
    @State private var outputUnit = "meters"
    @FocusState private var numberIsFocused : Bool
    
    var units = ["meters", "kilometers", "feet", "yards", "miles"]
    
    var convertedResult : Double {
        
        var inputInMeters : Double
        
        // Convert input to meters first
        switch inputUnit {
        case "meters":
            inputInMeters = inputNumber
        case "kilometers":
            inputInMeters = inputNumber * 1000
        case "feet":
            inputInMeters = inputNumber * 0.3048
        case "yards":
            inputInMeters = inputNumber * 0.9144
        case "miles":
            inputInMeters = inputNumber * 1609.34
        default:
            inputInMeters = inputNumber
        }
        
        // Convert meters to the output unit
        switch outputUnit {
        case "meters":
            return inputInMeters
        case "kilometers":
            return inputInMeters / 1000
        case "feet":
            return inputInMeters / 0.3048
        case "yards":
            return inputInMeters / 0.9144
        case "miles":
            return inputInMeters / 1609.34
        default:
            return inputInMeters
        }
        
        
        
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Put the number you want to convert"){
                    TextField("Number", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($numberIsFocused)
                }
                Section("Choose the input Unit"){
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section("Choose the output Unit"){
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section("Result"){
                    Text(convertedResult, format: .number.precision(.fractionLength((2))))
                }
            }
            .navigationTitle("UnitsConverter")
            .toolbar {
                if numberIsFocused {
                    Button("Done") {
                        numberIsFocused = false
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
