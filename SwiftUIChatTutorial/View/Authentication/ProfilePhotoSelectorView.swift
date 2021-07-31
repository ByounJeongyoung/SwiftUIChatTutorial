//
//  ProfilePhotoSelectorView.swift
//  SwiftUIChatTutorial
//
//  Created by Young on 2021/07/31.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel : AuthViewModel
    
    
    var body: some View {
        VStack{
            Button(action: { imagePickerPresented.toggle()}, label: {
                if let profileImage = profileImage{
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                }else{
                    Image(systemName: "circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                        .padding(.top,44)
                        .foregroundColor(.black)
                    
                }
            })
            .sheet(isPresented:$imagePickerPresented, onDismiss: loadImage, content: {
                ImagePicker(image: $selectedImage)
            })
            
            Text(profileImage == nil ? "Select a profile phototo" : "Your profile so good!")
                .font(.system(size: 20,weight: .semibold))
            
            if let image = selectedImage {
                Button(action: {viewModel.uploadProfileImage(image:image)}, label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                })
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                .padding(.top, 24)
                
            }else{
                Text("ne")
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)  //convert Swift UI!!
        
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
