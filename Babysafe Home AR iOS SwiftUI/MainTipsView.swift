//
//  MainTipsView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 26.03.22.
//

import SwiftUI

struct MainTipsView: View {
    
    @EnvironmentObject var model: BabysafeViewModel
    
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .center) {
                
                ForEach($model.safetyTips) { $safetyTip in
                    
                    if safetyTip.isUnlocked {
                        
                        
                        NavigationLink(destination: MainTipDetailView(safetyTip: $safetyTip, selectedShop: $model.selectedShop)) {
                            GroupBox {
                                VStack {
                                    
                                    Image(safetyTip.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height:75, alignment: .center)
                                        .clipped()
                                        .cornerRadius(8)
                                    
                                    
                                    
                                    HStack {
                                        Text(LocalizedStringKey(safetyTip.title))
                                        //.font(.headline)
                                            .bold()
                                            .scaledToFill()
                                            .foregroundColor(.primary)
                                        
                                        Spacer()
                                        
                                        if safetyTip.isUnread {
                                            //Spacer()
                                            Image(systemName: "circlebadge.fill")
                                                .foregroundColor(.yellow)
                                                .multilineTextAlignment(.trailing)
                                        }
                                        Image(systemName: "chevron.right")
                                    }.padding(.bottom, 2)
                                    
                                    Text(LocalizedStringKey(safetyTip.description))
                                        .lineLimit(4)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.leading)
                                    
                                }
                            }.padding(.bottom)
                                .padding(.trailing)
                                .padding(.leading)
                            
                        }
                        
                    }
                    
                    
                }
                
                Spacer()
                Text("articles_header_info")
                    .font(.caption)
                    .padding(.trailing)
                    .padding(.leading)
                    .multilineTextAlignment(.center)
                
                Image("biddy_badge")
                    .resizable()
                    .frame(width: 100.0, height: 100.0)

            }
        }.onAppear (perform: {
            model.prepareNotification()
        })
        .navigationTitle("main_tab_tips")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MainTipsView_Previews: PreviewProvider {
    static var previews: some View {
        MainTipsView().environmentObject(BabysafeViewModel())
    }
}
