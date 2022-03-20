//
//  AuthViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/18.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser // makes a API call to the firebase server
        // If there is no login information, userSession would be 'nil'
    }
    
    func login() {
        print("Login")
    }
    
    func register(withEmail email: String, password: String,
                  image: UIImage?, fullname: String, username:String) {
        
        guard let image = image else {return}
        
        ImageUploader.uploadImage(image: image) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    // The email address is badly formatted.
                    // The password must be 6 characters long or more.
                    print(error.localizedDescription)
                    return // 에러 발생하면 리턴은 필수
                }
                
                guard let user = result?.user else { return }
                self.userSession = user
                
                let data = ["email": email,
                            "username": username,
                            "fullname": fullname,
                            "profileImageUrl": imageUrl,
                            "uid": user.uid]
                
                Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                    self.userSession = user
                }
            }
        }
    }
    
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        
    }
}
