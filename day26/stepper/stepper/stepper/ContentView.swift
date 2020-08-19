//
//  ContentView.swift
//  stepper
//
//  Created by Choi SeungHyuk on 2020/08/13.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
//        Stepper(value: $sleepAmount) {
//            Text("\(sleepAmount) hours")
//        }
        
        Stepper(value: $sleepAmount, in: 4...12) {
            Text("\(sleepAmount) hours")
        } // in: 을 사용하셔 stepper의 범위를 제한
        
//        Text("\(sleepAmount, specifier: "%.2f") hours")
        // 출력시에 소숫점 두자리까지로 출력을 제한
        // %g 를 사용할경우 필요없는 0을 자동 제거
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
