//
//  SwiftUIListDemo.swift
//  SwiftUI_Study
//
//  Created by 현수 노트북 on 10/21/24.
//

import SwiftUI

struct TodoItem: Identifiable {
    var id = UUID()
    var task: String
    var imageName: String
}

struct SwiftUIListDemo: View {
    @State private var toggleState = false
    @State var listData: [TodoItem] = [
        TodoItem(task: "Take out the trash", imageName: "trash.circle.fill"),
        TodoItem(task: "Do the laundry", imageName: "laundry.fill"),
        TodoItem(task: "Buy groceries", imageName: "cart.fill"),
        TodoItem(task: "Walk the dog", imageName: "figure.walk")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Settings")) {
                    Toggle(isOn: $toggleState) {
                        Text("Allow Notification")
                    }
                }
                
                Section(header: Text("Todo")) {
                    ForEach(listData) { item in
                        NavigationLink(value: item.id) {
                            HStack{
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
            }
            .refreshable {
                listData = [
                    TodoItem(task: "Take out the trash", imageName: "trash.circle.fill"),
                    TodoItem(task: "Take out the trash", imageName: "trash.circle.fill"),
                    TodoItem(task: "Take out the trash", imageName: "trash.circle.fill")
                ]
            }
            .navigationTitle(Text("Title"))
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
            }
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        listData.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    SwiftUIListDemo()
}
