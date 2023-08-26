//
//  ContentView.swift
//  quotes_siwftUI
//
//  Created by 최영호 on 2023/08/26.
//

import SwiftUI

struct quotes{
    let content : String
    let name : String
}


struct ContentView: View {
    
    let str_array : [quotes] = [quotes(content: "명언 1", name: "이름 1"), quotes(content: "명언 2", name: "이름 2"), quotes(content: "명언 3", name: "이름 3")]
    
    @State var current_num : Int = 0
    
    var body: some View {
        VStack {
            Text("명언 생성기")
            
            ZStack{
                Rectangle()
                    .foregroundColor(.yellow).opacity(0.3)
                VStack{
                    Text("\(str_array[current_num].content)")
                    Text("\(str_array[current_num].name)")
                }
            }
            
            Button(action: {
                touch_btn()
            }, label: {
                Text("click")
            })
        }
    }
    
    func touch_btn(){
        print("tab")
        if current_num == 2{
            current_num = 0
        }
        else{
            current_num += 1
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
