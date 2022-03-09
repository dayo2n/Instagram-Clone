//
//  ProfileHeader.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/09.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Image("howl")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
            
                Spacer()
            
                HStack(spacing: 16) {
                    UserStatView(value: 1, title: "Posts")
                    UserStatView(value: 458, title: "Followers")
                    UserStatView(value: 324, title: "Following")
                }
                .padding(.trailing)
            }
            
            Text("howl")
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("Magician")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                
                ProfileActionButtonView()
                
                Spacer()
            }
                .padding(.top, 10)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
