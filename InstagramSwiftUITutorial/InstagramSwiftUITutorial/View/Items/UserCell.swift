//
//  UserCell.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/08.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            // image
            Image("karigurashi")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle()) // without setting corner radius
            
            // VStack -> username, fullname
            VStack(alignment: .leading) { // 왼쪽 정렬, .trailing: 오른쪽 정렬, 나머지는 사용불가! 오류남!
                Text("pony._.o")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Ponyo")
                    .font(.system(size: 14))
            }
            
            Spacer() // HStack 내의 가장 위에 쓰면 모든 요소가 오른쪽 정렬됨
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
