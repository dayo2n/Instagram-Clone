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
    @Binding var searchText: String
    
    var users: [User] {
        return searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(users) { user in
                    NavigationLink (
                        destination: ProfileView(),
                        label: {
                            UserCell(user: user)
                                .padding(.leading)
                    })
                }
            }
        }
    }
}
