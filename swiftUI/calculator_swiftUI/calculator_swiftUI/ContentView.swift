//
//  ContentView.swift
//  calculator_swiftUI
//
//  Created by 최영호 on 2023/09/04.
//

import SwiftUI

protocol clac{
    var num : Int {get}
    var sign : String {get}
}

struct ContentView: View {
//    var num: Int
//    var sign: String
    
    
    @State var yellow_color : Color = Color(red: 224/255, green: 170/255, blue: 66/255)
    @State var gray_color : Color = Color(red: 184/255, green: 184/255, blue: 184/255)
    
    @State var black_color : Color = Color(red: 76/255, green: 76/255, blue: 76/255)
    
    
    @State var sign_arr : [String] = ["+", "-", "/", "*", "="]
    @State var number_arr : [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "."]
    
    @State var main_label : String = "0"
    
    @State var clac_arr : [Int] = []
    @State var sign : String = ""
    
    var body: some View {
        
        
        VStack(spacing: 0){
            HStack{
                Text("\(main_label)")
                    .font(.system(size: font_size(size: main_label.count)))
            }
            .frame(height: 50)
            
            HStack{
                
                VStack{
                    
                    
                    HStack(spacing: 0){
                        
                        Capsule()
                            .frame(width: 250, height: 80)
                            .foregroundColor(gray_color)
                            .overlay(VStack{
                                Text("AC")
                                    .font(.system(size: 50))
                            })
                            .onTapGesture {
                                print("AC")
                                main_label = "0"
                                clac_arr.removeAll()
                            }

                    }
                    
                    ForEach(0 ..< 3){j in
                        HStack{
                            ForEach(0 ..< 3){i in
                                circle_view(color_backgorund: $black_color, inner_overlay: $number_arr[(j * 3) + i], main_label: $main_label,
                                get_arr: $clac_arr,get_sign: $sign)
                            }
                        }
                    }
//                    Color.red
                    HStack{
                        Capsule()
                            .frame(width: 170, height: 80)
                            .foregroundColor(black_color)
                            .overlay(VStack{
                                Text("0")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            })
                            .onTapGesture {
                                
                                print("0")
                                main_label += "0"
                            }
                        
                        circle_view(color_backgorund: $black_color, inner_overlay: $number_arr[9], main_label: $main_label,
                                    get_arr: $clac_arr,get_sign: $sign)
                    }
                    
                }
                .frame(width: UIScreen.main.bounds.midX + 70)
                VStack{
//                    Color.blue
                    ForEach(0 ..< 5){i in
                        circle_view(color_backgorund: $yellow_color, inner_overlay: $sign_arr[i], main_label: $main_label,
                                    get_arr: $clac_arr,get_sign: $sign)
                    }
                }
            }
            .frame(height: 500)
            
            
        }
    }
    
    func font_size(size : Int) -> Double{
        
        return 100 - (Double(size) * 5.5)
    }
}

struct circle_view : View{
    
    @Binding var color_backgorund : Color
    @Binding var inner_overlay : String
    @Binding var main_label : String
    @Binding var get_arr : [Int]
    @Binding var get_sign : String
    var body: some View{
        Circle()
            .frame(width: 80, height: 80)
            .foregroundColor(color_backgorund)
            .overlay(VStack{
                Text("\(inner_overlay)")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            })
            .onTapGesture {
                print("\(inner_overlay)")
                
                if(inner_overlay == "+"){
                    get_arr.append(Int(main_label)!)
                    main_label = ""
                    print(get_arr[0])
                    get_sign = "+"
                }
                else if(inner_overlay == "-"){
                    get_arr.append(Int(main_label)!)
                    main_label = ""
                    print(get_arr[0])
                    get_sign = "-"
                }
                else if(inner_overlay == "/"){
                    get_arr.append(Int(main_label)!)
                    main_label = ""
                    print(get_arr[0])
                    get_sign = "/"
                }
                else if(inner_overlay == "*"){
                    get_arr.append(Int(main_label)!)
                    main_label = ""
                    print(get_arr[0])
                    get_sign = "*"
                }
                
                
                
                if(inner_overlay == "="){
                    get_arr.append(Int(main_label)!)
                    print(get_arr[0])
                    print(get_arr[1])
                    print(get_sign)
                    if(get_sign == "+"){
                        main_label = String(get_arr[0] + get_arr[1])
                        
                        get_arr.removeAll()
                    }
                    else if(get_sign == "-"){
                        
                        main_label = String(get_arr[0] - get_arr[1])
                        
                        get_arr.removeAll()
                    }
                    else if(get_sign == "/"){
                        main_label = String(get_arr[0] / get_arr[1])
                        
                        get_arr.removeAll()
                    }
                    else if(get_sign == "*"){
                        main_label = String(get_arr[0] * get_arr[1])
                        
                        get_arr.removeAll()
                    }
                    
                    
                }
                
                if(main_label.count > 9){
                    
                    print("stop")
                }
                else{
                    if(main_label == "0"){
                        main_label = ""
                        main_label += inner_overlay
                    }
                    else{
                        if(inner_overlay == "+" || inner_overlay == "-" || inner_overlay == "/" || inner_overlay == "*" || inner_overlay == "="){
                            
                        }else{
                            main_label += inner_overlay
                        }
                    }
                }
            }
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
