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
    
    init() {
        userSession = Auth.auth().currentUser // makes a API call to the firebase server
        // If there is no login information, userSession would be 'nil'
    }
    
    func login() {
        print("Login")
    }
    
    func register(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                // The email address is badly formatted.
                // The password must be 6 characters long or more.
                print(error.localizedDescription)
                return // 에러 발생하면 리턴은 필수
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("Successfully registered user...")
        }
        print(email)
        print(password)
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        
    }
}
