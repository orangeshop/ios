//
//  side_menu_header_view.swift
//  side_bar_test
//
//  Created by 최영호 on 2023/09/26.
//

import SwiftUI

struct side_menu_header_view: View {
    @Binding var ishowing : Bool
    var body: some View {
        ZStack(alignment: .topTrailing){
            
            Button (action:{
                ishowing = false
            }, label: {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
                    .padding()
            })

            
            VStack(alignment: .leading){
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.bottom, 16)
                
                Text("abcd")
                    .font(.system(size: 24, weight: .semibold))
                
                Text("abcd")
                    .font(.system(size : 14))
                
                HStack(spacing: 12){
                    HStack(spacing: 4){
                        Text("1234").bold()
                        Text("aaaaa")
                    }
                    
                    HStack(spacing: 4){
                        Text("1234").bold()
                        Text("aaaaa")
                        
                    }
                    Spacer()
                }
                
                
                Spacer()
                
            }
            .padding()
        }
    }
}

struct side_menu_header_view_Previews: PreviewProvider {
    static var previews: some View {
        side_menu_header_view(ishowing: .constant(true))
    }
}
