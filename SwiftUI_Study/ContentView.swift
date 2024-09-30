//
//  ContentView.swift
//  SwiftUI_Study
//
//  Created by 현수 노트북 on 9/30/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            CustomView()
            ButtonView()
            Label("SwiftUI", systemImage: "person.circle.fill")
                .font(.largeTitle)
            Label(
                title: {
                    Text("이게 되는 건가")
                },
                icon: {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 25, height: 25)
                }
            )
        }
        .padding()
    }
}

struct CustomView: View {
    var body: some View {
        HStack {
            Text("Custom ")
                .font(.headline)
            Text("View")
                .modifier(StandardTitle())
        }
    }
}

struct StandardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(Color.white)
            .border(Color.gray, width: 0.5)
            .shadow(color: Color.black, radius: 5, x: 0, y: 5)
    }
}

struct ButtonView: View {
    var body: some View {
        Button(action: {
            
        }) {
            Image(systemName: "square.and.arrow.down")
        }
    }
}

struct CustomVStack<Content: View>: View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 10) {
            content()
        }
        .font(.largeTitle)
    }
}

#Preview {
    ContentView()
}
