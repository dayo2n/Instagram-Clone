//
//  UploadPostViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/05/24.
//

import SwiftUI
import Firebase

class UploadPostViwModel: ObservableObject {
    
    func uploadPost(caption: String, image: UIImage) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        // imageUploader가 uploadImage를 호출하면 파이어베이스에 도큐먼트로 데이터를 추가 
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            let data = ["caption" : caption,
                        "timestamp": Timestamp(date: Date()),
                        "likes": 0,
                        "imageUrl": imageUrl,
                        "ownerUid": user.id ?? "",
                        "ownerImageUrl": user.profileImageUrl,
                        "ownerUsername": user.username] as [String: Any]
            
            COLLECTION_POSTS.addDocument(data: data) { _ in
                print("DEBUG: Uploaded post")
            }
        }
    }
}
