//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Khumbongmayum Tonny on 22/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputNumber: Double? = nil
    @State private var convertTemperatureFrom: String = "Celsius"
    @State private var convertTemperatureTo: String = "Celsius"
    @FocusState private var focusedNumber: Bool
    
    var outputNumber: Double? {
        convertTemperature(from: convertTemperatureFrom, to: convertTemperatureTo, value: inputNumber ?? 0)
    }
    
    let units: [String] = [
        "Celsius", "Fahrenheit", "Kelvin"
    ]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter value", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($focusedNumber)
                    
                    Picker("Convert from", selection: $convertTemperatureFrom) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Convert from")
                }
                
                Section {
                    Picker("Converted to", selection: $convertTemperatureTo) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("\(outputNumber ?? 0, format: .number) \(convertTemperatureTo)")
                } header: {
                    Text("Converted to")
                }

            }
            .navigationTitle(Text("Temperature Convert"))
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        focusedNumber = false
                    }
                }
            }
        }
    }
    
    // Conversion Logic
    func convertTemperature(from convertTemperatureFrom : String, to convertTemperatureTo: String, value: Double) -> Double? {
        switch convertTemperatureFrom.lowercased() {
        case "celsius":
            switch convertTemperatureTo.lowercased() {
            case "celsius":
                return value
            case "fahrenheit":
                return (value * 9/5) + 32
            case "kelvin":
                return value + 273.15
            default:
                return nil
            }
        case "fahrenheit":
            switch convertTemperatureTo.lowercased() {
            case "celsius":
                return (value - 32) * 5/9
            case "fahrenheit":
                return value
            case "kelvin":
                return (value - 32) * 5/9 + 273.15
            default:
                return nil
            }
        case "kelvin":
            switch convertTemperatureTo.lowercased() {
            case "celsius":
                return value - 273.15
            case "fahrenheit":
                return (value - 273.15) * 9/5 + 32
            case "kelvin":
                return value
            default:
                return nil
            }
        default:
            return nil
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
