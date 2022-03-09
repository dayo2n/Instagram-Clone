//
//  UploadPostView.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/08.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var seletedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: {}, label: {
                    Image("add-image")
                        .resizable()
                        .renderingMode(.template) // 이미지 불투명 영역의 색을 바꿀 수 있는
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.black)
                })
            } else {
                HStack(alignment: .top) {
                    Image("ponyo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    TextField("Enter your caption...", text: $captionText)
                }
                .padding()
                
                Button(action: {}, label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                })
                    .padding()

            }
            
            Spacer()
        }
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
