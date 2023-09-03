//
//  secondView.swift
//  billboard_swiftUI
//
//  Created by 최영호 on 2023/09/03.
//

import SwiftUI

struct secondView: View {
    @Binding var main_text_str : String
    @Binding var back_color : UIColor
    @Binding var text_color : Color
    @State var tag_num : [Int] = [0,1,2]
    @State var back_color_arr : [UIColor] = [.red, .blue, .yellow]
    @State var text_color_arr : [Color] = [.purple, .orange, .brown]
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                
                Text("내용을 적으세요")
                    .font(.system(size: 40))
                TextField("적는 곳", text: $main_text_str)
                    .frame(height: 40)
            }
            
            VStack(alignment: .leading){
//                Color.yellow
                Text("배경색 설정")
                    .font(.system(size: 40))
                HStack{
                    ForEach(0 ..< 3){i in
                        
                        circle_view(test_back_color: $back_color, color_input: $back_color_arr[i])
                    }
                }
            }
            
            VStack(alignment: .leading){
                Text("문자색 설정")
                    .font(.system(size: 40))
                HStack{
                    ForEach(0 ..< 3){i in
                        
                        circle_view_2(test_text_color: $text_color, color_input: $text_color_arr[i])
                    }
                }
            }
        }
        .padding(20)
    }
}

struct circle_view : View{
    @Binding var test_back_color : UIColor
    @Binding var color_input : UIColor
    var body: some View{
        VStack{
            let _ = print("\(color_input)")
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(Color(color_input))
                .onTapGesture {
                    print("\(Color(uiColor: color_input))")
                    test_back_color = color_input
                }
        }
    }
}

struct circle_view_2 : View{
    @Binding var test_text_color : Color
    @Binding var color_input : Color
    var body: some View{
        VStack{
            let _ = print("\(color_input)")
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(color_input)
                .onTapGesture {
//                    print("\(Color(uiColor: color_input))")
                    test_text_color = color_input
                }
        }
    }
}

struct secondView_Previews: PreviewProvider {
    static var previews: some View {
        secondView(main_text_str: .constant(""), back_color: .constant(.white), text_color: .constant(.black))
    }
}
