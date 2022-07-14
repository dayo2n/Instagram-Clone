//
//  User.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/04/24.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    @DocumentID var id: String?
    var bio: String?
    var stats: UserStats?
    var isFollowed: Bool? = false
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id}
}

struct UserStats: Decodable {
    var following: Int
    var posts: Int
    var followers: Int
}
