//
//  EditProfileView.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/07/14.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var bioText = ""
    var body: some View {
        VStack {
            HStack {
                Button(action: {} , label: {
                    Text("Cancel")
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("Done").bold()
                })
            }.padding()
            
            TextArea(text: $bioText, placeholder: "Add your bio..")
                .frame(width: 370, height: 200)
                .padding()
            
            Spacer()
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
