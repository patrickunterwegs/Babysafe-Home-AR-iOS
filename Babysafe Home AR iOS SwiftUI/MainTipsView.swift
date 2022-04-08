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
            VStack(alignment: .center) {

                List {
                    
                    ForEach($model.safetyTips) { $safetyTip in
                        NavigationLink(destination: MainTipDetailView(safetyTip: $safetyTip, selectedShop: $model.selectedShop)) {
                            Text(LocalizedStringKey(safetyTip.title))
                                .font(.subheadline)
                                .bold()
                                .scaledToFill()
                            Spacer()
                            Image(systemName: "circlebadge.fill")
                                .foregroundColor(.yellow)
                                .multilineTextAlignment(.trailing)

                        }
                        .navigationTitle("main_tab_tips")
                        .navigationBarTitleDisplayMode(.inline)

                        
                        /*
                        if safetyTip.isUnlocked {
                            //ChecklistItemView(babyDanger: $babyDanger, selectedShop: $model.selectedShop)
                            NavigationLink(destination: MainTipDetailView()) {
                                Text(safetyTip.title)
                                Spacer()
                                Image(systemName: "circlebadge.fill").foregroundColor(.yellow)
                            }
                        }
                         */
                    }
                }
            
            
            Spacer()
            HStack {
                Spacer()
                Text("articles_header_info")
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                Image("biddy_badge")
                    .resizable()
                    .frame(width: 100.0, height: 100.0)
            }
        }
    }
}

struct MainTipsView_Previews: PreviewProvider {
    static var previews: some View {
        MainTipsView().environmentObject(BabysafeViewModel())
    }
}
