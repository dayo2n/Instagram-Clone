//
//  UploadPostView.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/03/08.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @Binding var tabIndex: Int
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: { imagePickerPresented.toggle() }, label: {
                    Image("add-image")
                        .resizable()
                        .renderingMode(.template) // 이미지 불투명 영역의 색을 바꿀 수 있는
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.black)
                }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })
            } else if let image = postImage { // 선택한 이미지를 넣도록
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()

                    TextArea(text: $captionText, placeholder: "Enter your caption...")
                        .frame(height: 180)
                }
                .padding()
                
                Button(action: {
                    if let image = selectedImage {
                        viewModel.uploadPost(caption: captionText, image: image) { _ in
                            captionText = " "
                            postImage = nil
                            tabIndex = 0
                        }
                    }
                }, label: {
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

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}
