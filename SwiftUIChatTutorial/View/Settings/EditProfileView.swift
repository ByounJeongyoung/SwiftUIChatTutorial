//
//  EditProfileView.swift
//  SwiftUIChatTutorial
//
//  Created by Young on 2021/07/31.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var fullname = "Gee"
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage? //optional에 주의 UIkit image
    @State private var profileImage: Image? //swift image
    
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(alignment:.leading, spacing: 44){
                //header
                VStack {
                    HStack{
                        //photo,edit button
                        VStack{//사진 있다면
                            if let profileImage = profileImage{
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                                
                            }else{//사진 없다면
                                Image("1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                                
                            }
                            
                            
                            Button(action: {
                                showImagePicker.toggle()
                            }, label: {
                                Text("Edit")
                            })
                            .sheet(isPresented: $showImagePicker, onDismiss: loadImage){
                                ImagePicker(image: $selectedImage)
                            }
                            //sheet 사용법 주의 -> 기본형태에서 많이 삭제 함
                            //                            //onDismiss
                            //                            The closure to execute when dismissing the sheet.
                            //                            content
                            //                            A closure returning the content of the sheet.
                    //실행이 종료될때 함수 출력 onDismiss
                            //$ 는 값이 변할때 사용
                            
                            //바인딩 서로 연결 어케아냐>?
                            //바인딩했다면   ImagePicker(image: $selectedImage)이렇게 변수가 있음
                            //사진 선택 -? loadImage함수 호출
                            //->selectedImage를 통해  이미지 변경
                            //-> 프로필 이미지 변경
                            //화면이 꺼질때 onDismiss 실행 (imagepicker에서 자동으로 꺼질때 실행?
                            //가져온 값(바인딩)으로 값 변경 함수실행 ㅜ
                        }
                        .padding(.top)
                        
                        Text("Enter your name or change your profile")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .padding([.bottom,.horizontal])
                    }
                    
                    
                    .padding(.horizontal)
                    
                    TextField("", text: $fullname)
                        .padding(8)
                }
                .background(Color.white)
                
                
                //Status
                VStack(alignment: .leading){
                    //status text
                    Text("Status")
                        .padding()
                        .foregroundColor(.gray)
                    //status
                    NavigationLink(
                        destination: StatusSelectorView(),
                        label: {
                            HStack{
                                Text("At the movie")
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                        })
                    
                }
                
                Spacer()
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
    }
    
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)  //convert Swift UI!!
        
    }
}

struct EditProfileView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        
        
        EditProfileView()
    }
}
