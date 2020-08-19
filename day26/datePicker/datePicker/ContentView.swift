//
//  ContentView.swift
//  datePicker
//
//  Created by Choi SeungHyuk on 2020/08/20.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date()
    
    var body: some View {
//        DatePicker("Please enter a date", selection: $wakeUp)
        //이대로 사용하면 label이 너무 흉측하다
        
//        DatePicker("", selection: $wakeUp)
        //데이터 피커의 라벨을 비워둬도 공간은 그대로 차지한다, 그리고 시각장애인을 위한 보이스오버가 제대로 동작 안할것이다
        
        //위의 문제들에 대한 첫번째 대안
        Form {
            DatePicker("Please enter a date", selection: $wakeUp)
        }
        
        //두번째 대안 - 라벨을 숨길수 있다
//        DatePicker("Please enter a date", selection: $wakeUp)
//        .labelsHidden()
        
        
        //시, 분만 입력받길 윈하는경우
//        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)

        
        //stepper예제의 in: 처럼 범위의 제한을 거는 방법들
        // when you create a new Date instance it will be set to the current date and time
//        let now = Date()

        // create a second Date instance set to one day in seconds from now
//        let tomorrow = Date().addingTimeInterval(86400)

        // create a range from those two
//        let range = now ... tomorrow
    
        //현재보다 과거는 선택 불가능하게 하는 예제
//    DatePicker("Please enter a date", selection: $wakeUp, in: Date()...)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
