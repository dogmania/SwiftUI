//
//  SwiftUI_StudyApp.swift
//  SwiftUI_Study
//
//  Created by 현수 노트북 on 9/30/24.
//

import SwiftUI

@main
struct SwiftUI_StudyApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            LifecycleDemo()
        }
        .onChange(of: scenePhase) {
            switch scenePhase {
                case .background:
                    print("Background")
                case .inactive:
                    print("Inactive")
                case .active:
                    print("Active")
                default:
                    print("Unknown")
            }
        }
    }
}
