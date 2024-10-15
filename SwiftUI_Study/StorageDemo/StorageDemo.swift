//
//  StorageDemo.swift
//  SwiftUI_Study
//
//  Created by 현수 노트북 on 10/15/24.
//

import SwiftUI

struct StorageDemo: View {
    var body: some View {
        TabView {
            SceneStorageView()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("SceneStorage")
                }
            AppStorageView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("AppStorage")
                }
        }
    }
}

#Preview {
    StorageDemo()
}
