//
//  ContentView.swift
//  side_bar_test
//
//  Created by 최영호 on 2023/09/26.
//

import SwiftUI

struct ContentView: View{
    @State private var isShowing = false
    var body: some View{
        NavigationView {
            ZStack{
                
                if isShowing{
                    side_menu_bar(ishowing: $isShowing)
                }
                
                Homeview()
                    .cornerRadius(isShowing ? 20 : 10)
                    .offset(x : isShowing ? 300 : 0, y : isShowing ? 44 : 0)
                    .scaleEffect(isShowing ? 0.8 : 1)
                    .toolbar{
                        ToolbarItem(placement : .navigationBarLeading){
                            Button(action: {
                                withAnimation(.spring()){
                                    isShowing.toggle()
                                }
                                
                            }, label: {
                                Image(systemName: "list.bullet")
                            })
                        }
                    }
                    .navigationTitle("Home")
            }
        }
    }
}

struct Homeview: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color(.white)
                
                Text("text")
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
