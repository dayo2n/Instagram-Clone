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
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser // makes a API call to the firebase server
        // If there is no login information, userSession would be 'nil'
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Login failed \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String,
                  image: UIImage?, fullname: String, username:String) {
        
        guard let image = image else {return}
        
        // enum을 사용하면 dot 연산자를 이용해 쉽게 선택가능 
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    // The email address is badly formatted.
                    // The password must be 6 characters long or more.
                    return // 에러 발생하면 리턴은 필수
                }
                
                guard let user = result?.user else { return }
                
                // 서버에 보낼 데이터 형태
                let data = ["email": email,
                            "username": username,
                            "fullname": fullname,
                            "profileImageUrl": imageUrl,
                            "uid": user.uid]
                
                // 서버에 데이터 전송
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    self.userSession = user
                    self.fetchUser()
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
        guard let uid = userSession?.uid else { return }
        print("DEBUG: uid \(uid)")
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            
            self.currentUser = user
        }
    }
}
