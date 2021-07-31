//
//  SettingHeaderView.swift
//  SwiftUIChatTutorial
//
//  Created by Young on 2021/07/30.
//

import SwiftUI


struct SettingsHeaderView: View {
   
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4){
                
                Text("Young")
                    .foregroundColor(.primary)
                
                Text("Available")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            Spacer()
        }
        .frame(height : 80)
        .background(Color.white)
    }
}
