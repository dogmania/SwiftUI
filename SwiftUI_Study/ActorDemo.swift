//
//  ActorDemo.swift
//  SwiftUI_Study
//
//  Created by 현수 노트북 on 10/14/24.
//

import SwiftUI

actor TimeStore {
    var timeStamps: [Int: Date] = [:]
    
    func addTask(task: Int, date: Date) {
        timeStamps[task] = date
    }
}

struct ActorDemo: View {
    
    var body: some View {
        Text("Actor Demo")
    }
    
    func doSomething() async {
        let store = TimeStore()
        
        await withTaskGroup(of: Void.self) { group in
            for i in 1...5 {
                group.addTask {
                    await store.addTask(task: i, date: await takesTooLong())
                }
            }
        }
        
        for (task, date) in await store.timeStamps {
            print("Task = \(task), Date = \(date)")
        }
    }
    
    func takesTooLong() async -> Date {
        sleep(5)
        return Date()
    }
}

struct Actor_Previews: PreviewProvider {
    static var previews: some View {
        ActorDemo()
    }
}
