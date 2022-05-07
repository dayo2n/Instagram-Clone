//
//  UserListView.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/08.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    // viewModel = SearchViewModel() 형태로 초기화하면 두 번 호출되니까 이렇게 하면 안됨, SearchView.swift에서 이미 초기화함
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.users) { _ in
                    NavigationLink (
                        destination: ProfileView(),
                        label: {
                            UserCell()
                                .padding(.leading)
                    })
                }
            }
        }
    }
}
