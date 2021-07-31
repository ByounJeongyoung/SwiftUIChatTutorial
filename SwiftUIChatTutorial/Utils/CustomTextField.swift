//
//  CustomTextField.swift
//  SwiftUIChatTutorial
//
//  Created by Young on 2021/07/30.
//

import SwiftUI

struct CustomTextField: View {
    let imageName : String
    let placeholderText: String
    let isSecuredField: Bool
    @Binding var text:  String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecuredField{
                    SecureField(placeholderText, text: $text)
        
                }else{
                    TextField(placeholderText, text: $text)
                }
             
            }
            Divider()
                .background(Color(.darkGray))
        }
    }
}
