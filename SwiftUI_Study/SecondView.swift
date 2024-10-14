//
//  SecondView.swift
//  SwiftUI_Study
//
//  Created by 현수 노트북 on 10/15/24.
//

import SwiftUI

struct SecondView: View {
    
    @EnvironmentObject var timerData: TimerData
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.headline)
        }
        .padding()
    }
}

#Preview {
    SecondView().environmentObject(TimerData())
}
