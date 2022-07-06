//
//  NotificationsViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/07/06.
//

import SwiftUI
import Firebase

class NotificationsViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    func fetchNotifictions() {
        
    }
    
    // initialize하지않고도 어디서나 호출할 수 있도록 static 함수로 선언
    static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        var data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                                   "username": user.username,
                                   "uid": user.id ?? "",
                                   "profileImageUrl": user.profileImageUrl,
                                   "type": type.rawValue]  // type.rawValue(원시값인 Int형)로 가져와야 충돌안남
        
        if let post = post, let id = post.id {
            data["postId"] = id
        }
        
        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
    }
}
