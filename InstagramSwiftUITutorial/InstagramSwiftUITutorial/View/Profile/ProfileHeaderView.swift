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
                    UserStatView()
                    UserStatView()
                    UserStatView()
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
                
                Button(action: {}, label: {
                    Text("Edit Profile")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 360, height: 32)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                })
                
                Spacer()
            }
                .padding(.top)
        }
    }
}

struct UserStatView: View {
    var body: some View {
        VStack {
            Text("2")
                .font(.system(size: 15, weight: .semibold))
            Text("Followers")
                .font(.system(size: 15)).frame(width: 80, alignment: .center)
        }.frame(width: 80, alignment: .center) // 요소 간 스태틱한 width를 부여
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
