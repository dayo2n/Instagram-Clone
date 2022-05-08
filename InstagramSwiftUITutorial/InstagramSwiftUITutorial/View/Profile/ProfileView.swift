//
//  ProfileView.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/08.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    @ObservedObject var viewModel : ProfileViewModel // 마찬가지로 타입 선언이 아님 객체 초기화X
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(viewModel: viewModel)
                PostGridView()
            }
            .padding(.top)
        }
    }
}
