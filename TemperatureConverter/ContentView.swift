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
    
    private var outputNumber: Double = 0
    
    let units: [String] = [
        "Celcius", "Fahrenheit", "Kelvin"
    ]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter value", value: $userInputNumber, format: .number)
                    
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
