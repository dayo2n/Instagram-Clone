//
//  ProfileViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/05/08.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        guard let uid = user.id else { return }

        UserService.follow(uid: uid) { _ in
            print("DEBUG: SUCCESS TO FOLLOW \(uid)")
        }
    }
    
    func unfollow() {
        print("DEBUG: Unfollow user...")
    }
    
    func checkIfUserIsFollowed() {
        
    }
}
