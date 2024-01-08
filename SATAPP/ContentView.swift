//
//  ContentView.swift
//  SATAPP
//
//  Created by Rachel Mills on 1/7/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            VStack {
                Text("Ready Test")
                    .font(.system(size: 45))
                    .fontWeight(.bold)
                    .padding([.top], 37)
                  
       
                Image(systemName: "square.and.pencil")
                    .font(.system(size: 150))
                    .padding([.bottom], 50)
                    
                    
                NavigationLink(destination: PracticeView()) {
                    Text("Practice")
                }.buttonStyle(TitleScreenButton())
                
                
                Button("Test") {
                    
                }
                .buttonStyle(TitleScreenButton())
                Button("Learn") {
                    
                }
                .buttonStyle(TitleScreenButton())
                Spacer()
            }
            
            
           // .navigationTitle("Ready Test").font(.largeTitle)
            .navigationBarTitleDisplayMode(.inline)
               .toolbar(content: {
                          ToolbarItem(placement: .navigationBarTrailing) {
                              Image(systemName: "line.3.horizontal")
                          }
                      })
               
        }

//        NavigationView {
//            Button(action: addItem) {
//                Label("Add Item", systemImage: "plus")
//              }
//                .navigationTitle("SwiftUI")
//                .navigationBarTitleDisplayMode(.inline)
////            List {
////                ForEach(items) { item in
////                    NavigationLink {
////                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
////                    } label: {
////                        Text(item.timestamp!, formatter: itemFormatter)
////                    }
////                }
////                .onDelete(perform: deleteItems)
////            }
////            .toolbar {
////                ToolbarItem(placement: .navigationBarTrailing) {
////                    EditButton()
////                }
////                ToolbarItem {
////                    Button(action: addItem) {
////                        Label("Add Item", systemImage: "plus")
////                    }
////                }
////            }
////            Text("Select an item")
//        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct TitleScreenButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 310, height: 50)
            .font(.system(size: 22))
            .background(Color(red: 1, green: 1, blue: 1))
            .cornerRadius(6)
            .foregroundStyle(.black)
            //.shadow(color: (Color(UIColor.lightGray)), radius: 15)
            .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.gray, lineWidth: 0.75)
                        
                )
            .scaleEffect(configuration.isPressed ? 1.05 : 1)
            .animation(.easeOut(duration: 0.3), value: configuration.isPressed)
            .padding([.top, .bottom], 6)
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
