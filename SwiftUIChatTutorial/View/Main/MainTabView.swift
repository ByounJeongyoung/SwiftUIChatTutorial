//
//  MainTabView.swift
//  SwiftUIChatTutorial
//
//  Created by Young on 2021/07/30.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    var body: some View {
        NavigationView{
            //tabView
            //each view for tab like channel
            TabView(selection: $selectedIndex){
                ConversationView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem { Image(systemName: "bubble.left") }
                    .tag(0)
                
                ChannelsView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem { Image(systemName: "bubble.left.and.bubble.right") }
                    .tag(1)
                
                SettingsView()
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem { Image(systemName: "gear") }
                    .tag(2)
            }
            .navigationTitle(tabTitle)
            
        }
    }
    var tabTitle: String{
        switch selectedIndex {
        case 0 : return "Chats"
        case 1 : return "Channel"
        case 2 : return "Settings"
        default: return ""
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

