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
            ForEach(0 ..< 10) { _ in
                FeedCell()
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
