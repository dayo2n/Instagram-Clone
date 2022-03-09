//
//  NotificationCell.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/09.
//

import SwiftUI

struct NotificationCell: View {
    
    @State private var showPostImage = true
    
    var body: some View {
        HStack {
            // image
            Image("karigurashi")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle()) // without setting corner radius
            
            Text("karigurashi").font(.system(size: 13, weight: .semibold))
            + Text(" liked one of your posts.")
                .font(.system(size: 14))
            
            Spacer()
            
            if showPostImage {
                Image("karigurashi")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipped() // frame에 맞춰 나머지는 자름
            } else {
                Button(action: {}, label: {
                    Text("Follow").padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(Color(.white))
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                })
            }
        }.padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
