//
//  ContentView.swift
//  Challenge
//
//  Created by Choi SeungHyuk on 2020/07/08.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput = ""
    @State private var userInputType = 0
    @State private var outputType = 0
    let types = ["m", "km", "ft", "yd"]
    
    var output: Double {
        let userDouble = Double(userInput) ?? 0
        var userMeter: Double
        
        switch userInputType {
        case 0:
            userMeter = userDouble
        case 1:
            userMeter = userDouble * 1000
        case 2:
            userMeter = userDouble / 3.28084
        case 3:
            userMeter = userDouble / 1.09361
        default:
            userMeter = -1
        }
        
        switch outputType {
            case 0:
                return userMeter
            case 1:
                return userMeter / 1000
            case 2:
                return userMeter * 3.28084
            case 3:
                return userMeter * 1.09361
            default:
                return -1
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("변환하고 싶은 길이 입력")) {
                    TextField("길이", text: $userInput)
                        .keyboardType(.decimalPad)
                    Picker("입력 단위", selection: $userInputType) {
                        ForEach(0 ..< types.count) {
                            Text("\(self.types[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("변환 결과")) {
                    Text("\(output, specifier: "%.2f") \(types[outputType])")
                    Picker("변환 단위", selection: $outputType) {
                        ForEach(0 ..< types.count) {
                            Text("\(self.types[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarTitle("길이 변환")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
