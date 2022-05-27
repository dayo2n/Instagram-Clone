//
//  FeedCell.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/08.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                KFImage(URL(string: post.ownerImageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text(post.ownerUsername)
                    .font(.system(size: 14, weight:
                                        .semibold))
            }
            .padding([.leading], 8)
            
            // post image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 400)
                .clipped()
            
            // acton buttons
            HStack(spacing: 10) {
                Button(action: {}, label: {
                Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
                Button(action: {}, label: {
                Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
                Button(action: {}, label: {
                Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                        .font(.system(size: 20))
                        .padding(4)
                })
            }
            .foregroundColor(.black)
            .padding(.leading, 4)
            
            //caption
            
            Text("\(post.likes) likes").font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack {
                Text("\(post.ownerUsername)").font(.system(size: 15, weight: .semibold)) + Text(" \(post.caption)").font(.system(size: 15))
            }
            .padding(.horizontal, 10)
            
            Text("2d").font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, -2)
        }
    }
}
