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
    }
    
    func follow() {
        guard let uid = user.id else { return }

        UserService.follow(uid: uid) { _ in
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
}
