//
//  ImageUploader.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/20.
// file to upload image to firebase

import Foundation
import Firebase
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let filename = NSUUID().uuidString // unique id generator
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: failed to ipload image \(error.localizedDescription)")
                return
            }
            
            
            ref.downloadURL { url , _ in
                guard let imageUrl = url?.absoluteString else { return } // 함수에서 String으로 받기로 해서 
                completion(imageUrl)
            }
        }
    }
}
