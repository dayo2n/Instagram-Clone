//
//  ProfileView.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/08.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(user: user)
                PostGridView()
            }
            .padding(.top)
        }
    }
}
