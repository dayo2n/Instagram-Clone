//
//  InstagramSwiftUITutorialApp.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/08.
//

import SwiftUI
import Firebase

@main
struct InstagramSwiftUITutorialApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            LoginView().environmentObject(AuthViewModel())
        }
    }
}
