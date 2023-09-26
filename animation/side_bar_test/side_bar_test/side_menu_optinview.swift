//
//  side_menu_optinview.swift
//  side_bar_test
//
//  Created by 최영호 on 2023/09/26.
//

import SwiftUI

struct side_menu_optinview: View {
    var body: some View {
        HStack(spacing: 14){
            Image(systemName: "person")
                .frame(width: 24, height: 24)
            
            Text("profile")
                .font(.system(size: 15, weight: .semibold))
            
            Spacer()
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct side_menu_optinview_Previews: PreviewProvider {
    static var previews: some View {
        side_menu_optinview()
    }
}
