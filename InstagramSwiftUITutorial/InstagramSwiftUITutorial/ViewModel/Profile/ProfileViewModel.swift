//
//  ProfileViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/05/08.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
        fetchUserStats()
    }
    
    func follow() {
        guard let uid = user.id else { return }

        UserService.follow(uid: uid) { _ in
            NotificationsViewModel.uploadNotification(toUid: uid, type: .follow)
            self.user.isFollowed = true
        }
    }
    
    func unfollow() {
        guard let uid = user.id else { return }
        
        UserService.unfollow(uid: uid) { _ in
            self.user.isFollowed = false
            print("DEBUG: UNFOLLOW \(uid)")
        }
    }
    
    // 이 메소드없으면 프로젝트 재실행 시 디폴트로 unfollow 상태의 뷰가 보인다 
    func checkIfUserIsFollowed() {
        guard !user.isCurrentUser else { return } // can't follow oneself
        guard let uid = user.id else { return }

        UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
    
    func fetchUserStats() {
        guard let uid = user.id else { return }
        
        COLLECTION_FOLLOWING.document(uid).collection("user-following").getDocuments { snapshot, _ in
            guard let following = snapshot?.documents.count else { return }
            
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").getDocuments { snapshot, _ in
                guard let followers = snapshot?.documents.count else { return }
                
                COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
                    guard let posts = snapshot?.documents.count else { return }
                    
                    self.user.stats = UserStats(following: following, posts: posts, followers: followers)
                    print(self.user.stats)
                }
            }
        }
    }
}
