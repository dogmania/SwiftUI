//
//  ConcurrencyDemo.swift
//  SwiftUI_Study
//
//  Created by 현수 노트북 on 10/11/24.
//

import SwiftUI

enum DurationError: Error {
    case tooLong
    case tooShort
}

struct ConcurrencyDemo: View {
    
    var body: some View {
        Button(action: {
            Task {
                await doSomething()
            }
        }) {
            Text("Do Something")
        }
    }
    
    func doSomething() async {
        var timeStamps: [Int: Date] = [:]
        
        await withTaskGroup(of: (Int, Date).self) { group in
            for i in 1...5 {
                group.addTask {
                    return(i, await takesTooLong())
                }
            }
            
            for await (task, date) in group {
                timeStamps[task] = date
            }
        }
        
        for (task, date) in timeStamps {
            print("Task = \(task), Date = \(date)")
        }
    }
    
    func takesTooLong() async -> Date {
        sleep(5)
        return Date()
    }
}

struct Concurrency_Previews: PreviewProvider {
    static var previews: some View {
        ConcurrencyDemo()
    }
}

struct MyStruct {
    var myResult: Date {
        get async {
            return await self.getTime()
        }
    }
    
    func getTime() async -> Date {
        sleep(5)
        return Date()
    }
}
