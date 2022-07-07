//
//  CommentCell.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/05/31.
//

import SwiftUI
import Kingfisher

struct CommentCell: View {
    let comment: Comment
    var body: some View {
        HStack {
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text(comment.username).font(.system(size: 14, weight: .semibold)) +
            Text(" \(comment.commentText)").font(.system(size: 14))
            // HStack을 쓰지않는 이유는 자동 Padding 때문인듯 -> 나중에 확인해보기
            
            Spacer()
            
            Text(" \(comment.timestampString ?? "")")
                .foregroundColor(.gray)
                .font(.system(size: 12))
                .padding(.trailing)
        }.padding(.horizontal)
    }
}
