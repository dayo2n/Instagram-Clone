//
//  FeedView.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/08.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView { // Embeded HStack
            LazyVStack(spacing: 32) { // 스택 간 간격을 조정
                ForEach(0 ..< 10) { _ in
                    FeedCell()
                }
            }
            .padding(.top)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
