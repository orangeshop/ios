//
//  ContentView.swift
//  coredata_self_programming
//
//  Created by 최영호 on 10/19/23.
//

import SwiftUI
import CoreData
struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var user : FetchedResults<User>
    
    @State private var isShowing : Bool = false
    
    
    var body: some View {
        NavigationStack{
            VStack{
//                Text("asdasd")
            }
            .navigationTitle("addddd")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    
                    NavigationLink(destination: plus_view()) {
                        Text("dd")
                    }
                    
                }
            }
            
            
            
            List {
                ForEach(user){user in
                    HStack{
                        Text(user.name!)
                        
                        Text("\(user.age)")
                    }
                }
            }
        }
        
    }
}

struct plus_view : View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    @State var name : String = ""
    @State var age : Double = 0
    @State var string_age = ""
    
    var body: some View {
        VStack{
            Text("asd")
            TextField("input name",text: $name)
            TextField("age", text: $string_age)
            
            let _ = print($string_age)
            
            Button(action: {
                age = Double(string_age) ?? 0
                CoreDataController().add_user(age: age, name: name, context: managedObjectContext)
                dismiss()
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
    }
}

#Preview {
    ContentView()
}
