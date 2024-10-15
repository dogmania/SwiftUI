//
//  SceneStorageView.swift
//  SwiftUI_Study
//
//  Created by 현수 노트북 on 10/15/24.
//

import SwiftUI

struct SceneStorageView: View {
    
    @SceneStorage("myText") private var editorText: String = ""
    
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}

#Preview {
    SceneStorageView()
}
