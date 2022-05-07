//
//  SearchViw.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/08.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var inSearchMode = false
    @ObservedObject var viewModel = SearchViewModel() // helps populate view
    
    var body: some View {
        ScrollView {
            // search bar
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            // grid view/ grid user
            ZStack {
                // 서치모드면 검색한 유저리스트가 보이도록, 아니면 포스트 그리드뷰가 보여야 함
                if inSearchMode {
                    UserListView(viewModel: viewModel, searchText: $searchText)
                } else {
                    PostGridView()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
