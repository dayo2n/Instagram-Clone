//
//  CommentCell.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/05/31.
//

import SwiftUI

struct CommentCell: View {
    var body: some View {
        HStack {
            Image("howl")
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text("howl").font(.system(size: 14, weight: .semibold)) +
            Text(" some test comment for now").font(.system(size: 14))
            // HStack을 쓰지않는 이유는 자동 Padding 때문인듯 -> 나중에 확인해보기
            
            Spacer()
            
            Text("2m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
                .padding(.trailing)
        }.padding(.horizontal)
    }
}

struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentCell()
    }
}
