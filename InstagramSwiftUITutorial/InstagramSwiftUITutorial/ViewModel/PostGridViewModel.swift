//
//  PostGridViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/05/30.
//

import SwiftUI

enum PostGridConfiguration {
    case explore
    case profile(String) // parameter를 가지는 enum
}

class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()
    let config: PostGridConfiguration
    
    init(config: PostGridConfiguration) {
        self.config = config
        
        fetchPosts(forConfig: config)
    }
    
    func fetchPosts(forConfig config: PostGridConfiguration) {
        switch config {
        case .explore:
            fetchExplorPagePosts()
        case .profile(let uid):
            fetchUserPosts(forUid: uid)
        }
    }
    
    func fetchExplorPagePosts() {
        // 좋아요순으로 정렬, but 썸네일을 클릭해 피드뷰로 보게되면 업로드 날짜(최신)순으로 정렬됨 -> 이 부분 구현X 
        COLLECTION_POSTS.order(by: "likes", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
    
    // ownerUid에 맞는 포스트만 fetch 
    func fetchUserPosts(forUid uid : String) {
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let posts = documents.compactMap({ try? $0.data(as: Post.self) })
            self.posts = posts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
        }
    }
}
