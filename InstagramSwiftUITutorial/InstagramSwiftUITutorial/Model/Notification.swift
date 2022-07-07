//
//  Notification.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/07/06.
//

import FirebaseFirestoreSwift
import Firebase

struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    var postId: String?
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String
    
    var isFollowed: Bool? = false
    // have to make this optional because we're using the Decodable protocol here.
    var post: Post? // optional이니까 디폴트값 필요 X 
}

enum NotificationType: Int, Decodable {
    case like, comment, follow // 자동으로 0부터 인덱스 부여
    
    var notificationMessage: String {
        switch self {
        case .like: return " liked one of your posts."
        case .comment: return " commented on one of your posts."
        case .follow: return " started following you."
        }
    }
}
