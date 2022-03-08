//
//  FeedCell.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/08.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Image("arietty")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text("arietty")
                    .font(.system(size: 14, weight:
                                        .semibold))
            }
            .padding([.leading], 8)
            
            // post image
            Image("arietty")
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
            
            Text("3 likes").font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack {
                Text("arietty").font(.system(size: 15, weight: .semibold)) + Text(" We're borrowers and as long as we have each other to live, for then we'll keep on living.").font(.system(size: 15))
            }
            .padding(.horizontal, 10)
            
            Text("2 days ago").font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, -2)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
