//
//  SettingCell.swift
//  SwiftUIChatTutorial
//
//  Created by Young on 2021/07/30.
//

import SwiftUI

struct SettingCell: View {
    let viewModel: SettingsCellViewModel
    
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22, alignment: .center)
                    .padding(6)
                    .background(viewModel.backgroundColor)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                
                Text(viewModel.title)
                    .font(.system(size: 15))
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    
            }
            .padding([.top,.horizontal])
            Divider()
                
                
        }
        .background(Color.white)
    }
}

//struct SettingCell_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingCell()
//    }
//}
