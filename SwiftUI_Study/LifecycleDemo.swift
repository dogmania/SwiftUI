//
//  LifecycleDemo.swift
//  SwiftUI_Study
//
//  Created by 현수 노트북 on 10/14/24.
//

import SwiftUI

struct LifecycleDemo: View {
    var body: some View {
        TabView {
            FirstTabView()
                .tabItem {
                    Image(systemName: "01.circle")
                    Text("First")
                }
            SecondTabView()
                .tabItem {
                    Image(systemName: "02.circle")
                    Text("Second")
                }
        }
    }
}

#Preview {
    LifecycleDemo()
}
