//
//  SettingsCellViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by Young on 2021/07/30.
//
import SwiftUI

//CaseIterable : 케이스 경우를 전달 할 수있다


enum SettingsCellViewModel : Int, CaseIterable{
    case account
    case notifications
    case starredMessages
    
    var title:String{
        switch  self {
        case .account : return "Account"
        case .notifications : return "notifications"
        case .starredMessages : return "starredMessages"
        }
    }
    
    var imageName:String{
        switch  self {
        case .account : return "key.fill"
        case .notifications : return "bell.badge.fill"
        case .starredMessages : return "star.fill"
        }
    }
    
    var backgroundColor:Color{
        switch  self {
        case .account : return .blue
        case .notifications : return .red
        case .starredMessages : return .yellow
        }
    }
    
}
