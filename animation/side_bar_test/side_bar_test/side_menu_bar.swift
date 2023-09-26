//
//  side_menu_bar.swift
//  side_bar_test
//
//  Created by 최영호 on 2023/09/26.
//

import SwiftUI

struct side_menu_bar: View {
    @Binding var ishowing : Bool
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                //header
                side_menu_header_view(ishowing: $ishowing)
                    .foregroundColor(.white)
                    .frame(height: 240)
                
                //call item
                ForEach(0 ..< 5) { _ in
                    side_menu_optinview()
                }
                
                Spacer()
            }
        }.navigationBarHidden(true)
    }
}

struct side_menu_bar_Previews: PreviewProvider {
    static var previews: some View {
        side_menu_bar(ishowing: .constant(true))
    }
}
