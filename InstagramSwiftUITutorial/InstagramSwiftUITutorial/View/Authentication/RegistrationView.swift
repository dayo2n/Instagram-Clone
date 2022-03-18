//
//  RegistrationView.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/09.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullname = ""
    
    @State private var seletedImage: UIImage?
    @State private var image: Image?
    @State var imagePickerPresented = false
    
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        ZStack {
            // 배경
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea() // ignore the safe area
            
            
            VStack {
                
                ZStack {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                            .padding()
                        
                    } else {
                        Button(action: {imagePickerPresented.toggle()}, label: {
                            Image("add-image")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .foregroundColor(.white)
                                
                        })
                            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                            ImagePicker(image: $seletedImage)
                        })
                        .padding()
                    }
                }
                   
                VStack {
                    // email field
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    // password field
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    // username field
                    CustomTextField(text: $username, placeholder: Text("Full name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    // fullname field
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
                    
                    // sign up
                    Button(action: {
                        viewModel.register()
                    }, label: {
                        Text("Sign Up")
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
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = seletedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}
