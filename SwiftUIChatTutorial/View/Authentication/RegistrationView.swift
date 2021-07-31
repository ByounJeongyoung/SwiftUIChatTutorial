//
//  RegistrationView.swift
//  SwiftUIChatTutorial
//
//  Created by Young on 2021/07/30.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var userName = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel : AuthViewModel
    
    
    var body: some View {
        VStack{
            
            NavigationLink(
                destination: ProfilePhotoSelectorView(),
                isActive: $viewModel.didAuthenticateUser,
                label: {
                    
                })
            
            VStack(alignment: .leading, spacing: 12){
                HStack{
                    Spacer() //왼쪽 정렬
                }
                Text("Get Started.")
                    .font(.largeTitle)
                    .bold()
                Text("Welcome Back")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                VStack(spacing: 40){
                    //외부에 영향을 끼치지 않고 내부의 위젯에서
                    //첫번째 고정후 변경
                    
                    CustomTextField(imageName: "envelope", placeholderText: "Email", isSecuredField: false, text: $email)
                    
                    CustomTextField(imageName: "person", placeholderText: "User name", isSecuredField: false, text: $userName)
                    
                    CustomTextField(imageName: "person", placeholderText: "Full name", isSecuredField: false, text: $fullName)
                    
                    CustomTextField(imageName: "lock", placeholderText:"Password", isSecuredField: true, text: $password)
                    
                }
                .padding([.top, . horizontal], 32) //베열로 표현
                
            }
            .padding(.leading)
            
            
            Button(action: {
                viewModel.register(email: email, userName: userName, fullName: fullName, password: password)
            }, label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding(.top,24)
                
            })
            .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
            Spacer()
            Button(action: {
                mode.wrappedValue.dismiss()
            }, label: {
                HStack{
                    
                    Text("Already have an account?")
                        .font(.system(size: 14))
                    
                    Text("Sign Up")
                        .font(.system(size: 14, weight: .semibold))
                }
            }).padding(.bottom, 32)
            
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
