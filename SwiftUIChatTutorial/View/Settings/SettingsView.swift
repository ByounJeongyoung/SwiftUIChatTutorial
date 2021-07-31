//
//  SettingsView.swift
//  SwiftUIChatTutorial
//
//  Created by Young on 2021/07/30.
//

//NavigationLink 오버라이드해서 색상이 바뀔수 있다

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 32){
                NavigationLink( //이동하는곳
                    destination: EditProfileView(),
                    label: { //보이는곳
                        SettingsHeaderView()
                    })
                
                VStack(spacing: 1) {
                    ForEach(SettingsCellViewModel.allCases, id: \.self){
                        viewModel in SettingCell(viewModel: viewModel)
                    }
                }
                // .frame(width: UIScreen.main.bounds.width, height: 50) 가로에 나만있을때 사용
                Button(action: {
                    
                }, label: {
                    Text("Log out")
                        .foregroundColor(.red)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: UIScreen.main.bounds.width, height: 50)
                        .background(Color.white)
                })
                
                Spacer()
                
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
