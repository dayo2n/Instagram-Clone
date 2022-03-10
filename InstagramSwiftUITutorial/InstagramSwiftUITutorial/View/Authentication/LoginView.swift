//
//  LoginView.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/09.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                // 배경
                LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea() // ignore the safe area
                
                
                VStack {
                    Image("instagram")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 220, height: 100)
                        .foregroundColor(.white)
                       
                    VStack {
                        // email field
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        // password field
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        // forgot password
                        
                        HStack {
                            Spacer()
                            
                            Button(action: {}, label: {
                                Text("Forgot Password?")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.top)
                                    .padding(.trailing, 28)
                            })
                        }
                        
                        // sign in
                        Button(action: {}, label: {
                            Text("Sign In")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 360, height: 50)
                                .background(Color(#colorLiteral(red: 0.6495094895, green: 0.252843529, blue: 1, alpha: 1)))
                            // frame 크기를 설정한 후에 배경 색을 지정해야 사이즈맞게 적용된다.
                                .clipShape(Capsule())
                            // 마찬가지로 클립쉐이프도 배경색이 지정된 후에 짤라주어야 한다.
                                .padding()
                        })
                        
                        Spacer()
                        
                        NavigationLink(destination: RegistrationView().navigationBarHidden(true), label: {
                            // go to sign in
                                HStack {
                                    Text("Don't have an account?")
                                        .font(.system(size: 13))
                                        .foregroundColor(.white)
                                    
                                    Text("Sign up")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.white)
                                }
                                .padding(.bottom, 16)
                        })
                    }
                }
                .padding(.top, -44)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
