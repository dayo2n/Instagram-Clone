//
//  ResetOasswordView.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/09.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    @Environment(\.presentationMode) var mode
    @Binding private var email: String
    
    init(email: Binding<String>) {
        self._email = email
    }
    
    var body: some View {
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
                    
                    Button(action: {
                        viewModel.resetPassword(withEmail: email)
                    }, label: {
                        Text("Send Reset Password Link")
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
                    
                    // dismiss할 때, go to last view
                    Button(action: {mode.wrappedValue.dismiss()}, label: {
                        HStack {
                            Text("Already have an account?")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                            
                            Text("Sign In")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, 16)
                    })
                }
            }
            .padding(.top, -44)
        }
        // $didSendResetPasswordLink가 false -> true가 되면 화면 자동 전환
        .onReceive(viewModel.$didSendResetPasswordLink, perform: { _ in
            self.mode.wrappedValue.dismiss()
        })
    }
}
