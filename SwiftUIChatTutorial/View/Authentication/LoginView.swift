//
//  LoginView.swift
//  SwiftUIChatTutorial
//
//  Created by Young on 2021/07/30.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        NavigationView{
            VStack {
                VStack(alignment: .leading, spacing: 12){
                    HStack{
                        Spacer() //왼쪽 정렬
                    }
                    Text("Hello.")
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
                        
                        CustomTextField(imageName: "lock", placeholderText:"Password", isSecuredField: true, text: $password)
                        
                        
                    }
                    .padding([.top, . horizontal], 32) //베열로 표현
                    
                }
                .padding(.leading)
                
                HStack{
                    Spacer()
                    
                    NavigationLink(
                        destination: Text("Rescet password"),
                        label: {
                            Text("Forgot password?")
                                .font(.system(size:13, weight: .semibold))
                                .padding(.top)
                                .padding(.trailing,28)
                            
                        })
                }
                Button(action: {
                    viewModel.login()
                }, label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                    
                    
                })
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                
                
                Spacer()
                
                NavigationLink(
                    destination: RegistrationView().navigationBarBackButtonHidden(true),
                    label: {
                        HStack{
                            
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                    }).padding(.bottom, 32)
                
            } //설정 필요
        }
        .padding(.top,-56)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


