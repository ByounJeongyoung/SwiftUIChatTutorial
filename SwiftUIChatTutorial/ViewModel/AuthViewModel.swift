//
//  AuthViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by Young on 2021/07/30.
//

import Firebase
import UIKit


class AuthViewModel: NSObject, ObservableObject {
    @Published var didAuthenticateUser = false
    private var tempCurrentUser: Firebase.User?
    
    
    func login(){
        print("login")
    }
    //콜백 형태로 돌아온다 콜백이란? 무언가 완료후 (로그인) 백엔드에서 가공후 돌려주는것
    func register(email: String,userName : String, fullName : String, password : String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("에러\(error.localizedDescription)")
                return //에러를 받았으면 그 상태 끝내기... 아니면 else문 사용!
            }
            
            guard let user = result?.user else { return }
            self.tempCurrentUser = user //고정
            
            let data : [String:Any] = ["email":email,
                                       "username" : userName,
                                       "fullName" : fullName,
                                        ]
            Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
               
                self.didAuthenticateUser = true
                
            }
        }
    }
    
    func uploadProfileImage(image : UIImage){
        //계속 사용할수있다
        //guard let userID = Auth.auth().currentUser?.uid else { return }
        guard let uid = tempCurrentUser?.uid else {return}
        print("호출")
        print(uid)
        
        ImageUpLoader.uploadImage(image: image) { imageUrl in
            print("aaaaa")
            Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl": imageUrl]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
                //updateData -> completion!
            }
        }
    
    
    func signout(){
        
    }
    
}
