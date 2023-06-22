//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Khumbongmayum Tonny on 22/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userInputNumber: Int = 0
    @State private var convertTemperatureFrom: String = "Celcius"
    @State private var convertTemperatureTo: String = "Fahrenheit"
    @FocusState private var focusedNumber: Bool
    
    private var outputNumber: Double = 0
    
    let units: [String] = [
        "Celcius", "Fahrenheit", "Kelvin"
    ]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter value", value: $userInputNumber, format: .number)
                        .keyboardType(.numberPad)
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
                    
                    Text(outputNumber, format: .number)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
