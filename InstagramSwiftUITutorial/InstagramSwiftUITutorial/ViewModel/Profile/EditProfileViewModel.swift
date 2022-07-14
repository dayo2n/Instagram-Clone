//
//  EditProfileViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/07/14.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    private let user: User
    @Published var uploadComplete = false
    
    init(user: User) {
        self.user = user
    }
    
    func saveUserData(_ bio: String) {
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["bio": bio]) { _ in
            self.uploadComplete = true
        }
    }
}
