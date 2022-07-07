//
//  Post.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/05/27.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp // must be import Firebase
    let ownerImageUrl: String
    
    var didLike: Bool? = false
    var user: User?
}
