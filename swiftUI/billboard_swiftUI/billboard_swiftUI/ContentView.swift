//
//  ContentView.swift
//  billboard_swiftUI
//
//  Created by 최영호 on 2023/09/03.
//

import SwiftUI

struct ContentView: View {
    
    @State var billboard : String = "temp string"
    @State var background_color : UIColor = .white
    @State var text_color : Color = .black
    var body: some View {
        NavigationView(){
            
//            NavigationLink(destination: secondView()){
//                Text("hello world")
//            }
            
//            Text("asd")
            
            VStack{
                
                ZStack{
                    
                    Color(background_color)
                    
                    Text("\(billboard)")
                        .font(.system(size: 100))
                        .foregroundColor(text_color)
                    
                }
                    
            }
            .navigationTitle("main")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(destination: secondView(main_text_str: $billboard, back_color: $background_color, text_color: $text_color)){
                        Text("setting")
                    }
                }
            })
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
