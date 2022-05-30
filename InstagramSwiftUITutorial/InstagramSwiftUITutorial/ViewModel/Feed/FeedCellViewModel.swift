//
//  FeedCellViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/05/30.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    var likeString: String {
        let label = (post.likes == 1) ? "like" : "likes"
        return "\(post.likes) \(label)"
    }
    
    init(post: Post) {
        self.post = post
    }
    
    func like() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        
        COLLECTION_POSTS.document(post.id ?? "").collection("post- likes").document(uid).setData([:]) { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).setData([:]) { _ in
                
                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes + 1])
                
                self.post.didLike = true
                self.post.likes += 1
            }
        }
    }
    
    func unlike() {
        
    }
    
    func checkIfUserLikedPost() {
        
    }
}
