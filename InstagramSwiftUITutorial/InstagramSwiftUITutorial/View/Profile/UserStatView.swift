//
//  UserStatView.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/09.
//

import SwiftUI

struct UserStatView: View {
    
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 15, weight: .semibold))
            Text(title)
                .font(.system(size: 15)).frame(width: 80, alignment: .center)
        }.frame(width: 80, alignment: .center) // 요소 간 스태틱한 width를 부여
    }
}
struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 1, title: "Posts")
    }
}
