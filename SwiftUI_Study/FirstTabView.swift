//
//  FirstTabView.swift
//  SwiftUI_Study
//
//  Created by 현수 노트북 on 10/14/24.
//

import SwiftUI

struct FirstTabView: View {
    
    @State private var title: String = "View One"
    
    var body: some View {
        Text(title)
            .onAppear(perform : {
                print("onAppear")
            })
            .onDisappear(perform: {
                print("onDisappear")
            })
            .task(priority: .background) {
                title = await changeTitle()
            }
    }
    
    func changeTitle() async -> String {
        sleep(5)
        return "Async Task"
    }
}

#Preview {
    FirstTabView()
}
