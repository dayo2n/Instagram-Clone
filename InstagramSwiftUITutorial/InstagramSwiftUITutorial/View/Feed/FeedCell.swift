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
            
            // post image
            Image("arietty")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 400)
                .clipped()
            
            // acton buttons
            HStack(spacing: 8) {
                Button(action: {}, label: {
                Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
                Button(action: {}, label: {
                Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
                Button(action: {}, label: {
                Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                })
            }.foregroundColor(.black)
            
            //caption
            HStack {
                Text("arietty").font(.system(size: 15, weight: .semibold)) + Text("  We're borrowers and as long as we have each other to live, for then we'll keep on living.").font(.system(size: 15))
            }
            
            Text("2d").font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.top)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
