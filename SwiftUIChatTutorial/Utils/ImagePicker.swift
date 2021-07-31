//
//  Imagepicker.swift
//  SwiftUIChatTutorial
//
//  Created by Young on 2021/07/31.
//

import SwiftUI

struct ImagePicker:UIViewControllerRepresentable {
    
    @Binding var image:UIImage? //optional에 주의
    @Environment(\.presentationMode) var mode
    
    
    func makeUIViewController(context: Context) ->  UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        //The delegate receives notifications when the user picks an image or movie, or exits the picker interface.
        return picker
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    //Just bridge swift UI and UIkit
    class Coordinator: NSObject,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
        
        let parent:ImagePicker
        
        init(_ parent : ImagePicker){
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            guard let image = info[.originalImage] as? UIImage else { return}
                
            self.parent.image = image
            self.parent.mode.wrappedValue.dismiss()
            
        }
    }
}
