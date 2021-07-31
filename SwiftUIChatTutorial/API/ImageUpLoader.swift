//
//  ImageUpLoader.swift
//  SwiftUIChatTutorial
//
//  Created by Young on 2021/07/31.
//

import Firebase
import UIKit

struct ImageUpLoader {
    
    
    static func uploadImage(image: UIImage, completion : @escaping(String) -> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        //자동완성 사용
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error{
                print("Fail image\(error.localizedDescription)")
                return}
            
        }
        print("success Image DownLoad to fireStorage")
        
//        ref.downloadURL { url, _ in
//            guard let imageUrl = url?.absoluteString else {return}
//            completion(imageUrl)
//        }
    }
}
