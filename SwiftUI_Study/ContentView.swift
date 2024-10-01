//
//  ContentView.swift
//  SwiftUI_Study
//
//  Created by 현수 노트북 on 9/30/24.
//

import SwiftUI

struct ContentView: View {
    @State var dynamicLayout: AnyLayout = AnyLayout(VStackLayout())
    let speedSetting: SpeedSetting = SpeedSetting()
    
    var body: some View {
        VStack {
            SpeedControlView()
            SpeedDisplayView()
        }
        .environmentObject(speedSetting)
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

struct LimitLineTestView: View {
    
    var body: some View {
        HStack {
            Image(systemName: "airplane")
            Text("어디까지 길어질 수 있는지 테스트")
            Text("길어지면 니가 뭘 할 수 있는데")
                .layoutPriority(1)
        }
        .lineLimit(1)
    }
}

struct GeometryView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("GeometryReader를 사용하면")
                    .font(.largeTitle)
                    .frame(width: geometry.size.width / 2,
                           height: (geometry.size.height / 4) * 3)
                Text("비율을 계산해서 배치하는 것이 가능하다.")
                    .font(.largeTitle)
                    .frame(width: geometry.size.width / 3,
                           height: geometry.size.height / 4)
            }
        }
    }
}

class SpeedSetting: ObservableObject {
    @Published var speed: Double = 0.0
}

struct SpeedControlView: View {
    @EnvironmentObject var speedSetting: SpeedSetting
    
    var body: some View {
        Slider(value: $speedSetting.speed, in: 0...100)
    }
}

struct SpeedDisplayView: View {
    @EnvironmentObject var speedSetting: SpeedSetting
    
    var body: some View {
        Text("Speed = \(speedSetting.speed)")
    }
}

#Preview {
    ContentView()
}
