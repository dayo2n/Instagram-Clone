//
//  User.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/04/24.
//

import FirebaseFirestoreSwift

struct User: Decodable{
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    let uid: String
    @DocumentID var id: String?
}