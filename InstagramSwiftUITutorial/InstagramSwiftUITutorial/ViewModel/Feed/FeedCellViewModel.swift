//
//  FeedCellViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/05/30.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func like() {
        
    }
    
    func unlike() {
        
    }
    
    func checkIfUserLikedPost() {
        
    }
}
