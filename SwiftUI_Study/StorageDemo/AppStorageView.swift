//
//  AppStorageView.swift
//  SwiftUI_Study
//
//  Created by 현수 노트북 on 10/15/24.
//

import SwiftUI

struct AppStorageView: View {
    
    @AppStorage("myText") private var text: String = "Text"
    
    var body: some View {
        TextEditor(text: $text)
            .padding(30)
            .font(.largeTitle)
    }
}

#Preview {
    AppStorageView()
}
