//
//  StatusSelectorView.swift
//  SwiftUIChatTutorial
//
//  Created by Young on 2021/07/31.
//

import SwiftUI

struct StatusSelectorView: View {
    
    @ObservedObject var viewModel = StatusViewModel()
    @State var status: UserStatus = .notConfigured
    
    
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView{
                VStack(alignment: .leading){
                    Text("CURRENTLY SET TO")
                        .foregroundColor(.gray)
                        .padding() //글씨도 커진다
                    
                    StatusCell(status: viewModel.status)
                        .frame(height:56) //기본 높이!!
                        .background(Color.white)
                    
                    Text("SELECT YOUR STATUS")
                        .foregroundColor(.gray)
                        .padding()
                        .frame(height: 40)
                    
                    
                    VStack {
                        ForEach(UserStatus.allCases.filter({$0 != .notConfigured //첫째 거르기
                        }), id: \.self) { status in
                            Button(action: {
                                viewModel.updateStatus(status)
                            }, label: {
                                
                                StatusCell(status: status)
                                //automatically model.text
                            })
                            Divider()
                                .padding(.horizontal)
                            
                        }
                    }
                    .background(Color.white)
                }
            }
        }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}

//Just one widget in this Stack
//If use Spacer -> Width can Entire Broad
struct StatusCell: View {
    
    let status: UserStatus
    
    var body: some View {
        HStack{
            Text(status.title)
                .foregroundColor(.primary)
            Spacer()
        }
        .padding()
        .background(Color.white)
        
        
        
        
        //        HStack{
        //            Text("Available")
        //            Spacer()
        //        }
        //        .padding()
        //        .background(Color.white)
    }
}
