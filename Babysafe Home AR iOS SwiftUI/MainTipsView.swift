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
                                        .frame(height:100, alignment: .center)
                                        .clipped()
                                        .cornerRadius(8)
                                    
                                    
                                    
                                    HStack {
                                        Text(LocalizedStringKey(safetyTip.title))
                                        //.font(.headline)
                                            .font(.title3)
                                            .bold()
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(.primary)
                                        
                                        Spacer()
                                        
                                        if safetyTip.isUnread {
                                            //Spacer()
                                            Image(systemName: "circlebadge.fill")
                                                .foregroundColor(.accentColor)
                                                .multilineTextAlignment(.trailing)
                                        }
                                        Image(systemName: "chevron.right")
                                    }.padding(.bottom, 2)
                                    
                                    Text(safetyTip.getDescriptionWithBabyname(babyName: model.babyName))
                                        .multilineTextAlignment(.leading)
                                        .font(.footnote)
                                        .lineLimit(4)
                                        .foregroundColor(.gray)
                                    
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
