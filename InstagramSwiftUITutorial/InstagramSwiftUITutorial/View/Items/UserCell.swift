//
//  UserCell.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/08.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        
        HStack {
            
            // image
            KFImage(URL(string: user.profileImageUrl)) // kingfisher 라이브러리에서 url 이미지 붙여줌
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle()) // without setting corner radius
            
            // VStack -> username, fullname
            VStack(alignment: .leading) { // 왼쪽 정렬, .trailing: 오른쪽 정렬, 나머지는 사용불가! 오류남!
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullname)
                    .font(.system(size: 14))
            }
            
            Spacer() // HStack 내의 가장 위에 쓰면 모든 요소가 오른쪽 정렬됨
        }
    }
}
