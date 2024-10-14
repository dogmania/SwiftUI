//
//  SecondTabView.swift
//  SwiftUI_Study
//
//  Created by 현수 노트북 on 10/14/24.
//

import SwiftUI

struct SecondTabView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        TextEditor(text: $text)
            .padding()
            .onChange(of: text) {
                print("onChange")
            }
    }
}

#Preview {
    SecondTabView()
}
