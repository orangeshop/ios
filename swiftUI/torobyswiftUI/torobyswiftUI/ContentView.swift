//
//  ContentView.swift
//  torobyswiftUI
//
//  Created by 최영호 on 2023/09/09.
//

import SwiftUI

struct ContentView: View {
    @State var items : [String] = ["apple", "banana", "lemon"]
    @State var items_check : [Bool] = [false, false, false]
    @State var alert_toggle : Bool = false
    @State var input_string : String = ""
    var body: some View {
        
        NavigationStack{
            List{
                Section(header: Text("today")){
                    ForEach(0 ..< items.count, id: \.self){item in
                        HStack{
                            Text("\(items[item])")
                            Rectangle()
                                .fill(.white)
                            Image(systemName: "checkmark")
                                .opacity(items_check[item] ? 1 : 0)
                        }
                        .onTapGesture {
                            print("asd \(item)")
                            items_check[item].toggle()
                        }
                            
                    }
                    .onDelete(perform: {target in
                        //                    items.remove(atOffsets: target)
                    })
                    .onMove(perform: {indices, newOffset in
                        items.move(fromOffsets: indices, toOffset: newOffset)
                        items_check.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
                
            }
            .listStyle(.automatic)
            .navigationTitle("To_do")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        print("add touch")
                        alert_toggle.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .alert("할 일 등록", isPresented: $alert_toggle, actions: {
                       
                        VStack{
                            TextField("", text: $input_string)
                            HStack{
                                Button("등록", action: {
                                    items.append("\(input_string)")
                                    items_check.append(false)
                                })
                                
                                Button("취소", action: {
                                    
                                })
                                .foregroundColor(.red)
                            }
                        }
                    })
                }
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContentView()
        }
    }
}
