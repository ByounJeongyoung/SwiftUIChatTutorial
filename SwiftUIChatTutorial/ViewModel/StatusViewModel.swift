//
//  StatusViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by Young on 2021/07/31.
//

import SwiftUI

class StatusViewModel: ObservableObject{
    @Published var status: UserStatus = .notConfigured //default
    
    func updateStatus(_ status: UserStatus){
        self.status = status
    }
}

enum UserStatus : Int, CaseIterable{
  
    case notConfigured
    case availlable
    case busy
    case school
    case movies
    case work
    case batteryLow
    case meeting
    case gym
    case sleeping
    case urgentCallsOnly
    
    var title : String{
        switch self {
        case .notConfigured: return "Click here to update your status"
        case .availlable: return "Available"
        case .busy: return "Busy"
        case .school: return "At school"
        case .movies: return "At the movies"
        case .work: return "At work"
        case .batteryLow: return "Battery about to die"
        case .meeting: return "In a meeting"
        case .gym: return "At the gym"
        case .sleeping: return "Coding"
        case .urgentCallsOnly: return "11"
        }
    }
}
