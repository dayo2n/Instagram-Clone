//
//  EditProfileView.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/07/14.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var bioText = ""
    @ObservedObject private var viewModel: EditProfileViewModel
    @Environment(\.presentationMode) var mode
    
    init(viewModel: EditProfileViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { mode.wrappedValue.dismiss() } , label: {
                    Text("Cancel")
                })
                
                Spacer()
                
                Button(action: { viewModel.saveUserData(bioText) }, label: {
                    Text("Done").bold()
                })
            }.padding()
            
            TextArea(text: $bioText, placeholder: "Add your bio..")
                .frame(width: 370, height: 200)
                .padding()
            
            Spacer()
        }
//        .onReceive(viewModel.$uploadComplete, perform: { _ in
//            self.mode.wrappedValue.dismiss()
//        })
    }
}
