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
    
    func register() {
        print("Register")
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        
    }
}
