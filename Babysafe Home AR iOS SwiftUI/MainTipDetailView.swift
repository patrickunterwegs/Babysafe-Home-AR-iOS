//
//  MainTipDetailView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 26.03.22.
//

import SwiftUI

struct MainTipDetailView: View {
    
    @Binding var safetyTip: SafetyTip
    @Binding var selectedShop: Shop
    //@State private var babyname: String = "Your baby"
    
    @State private var isShareSheetPresented: Bool = false
    
    @EnvironmentObject var model: BabysafeViewModel
    
    
    var body: some View {
        ScrollView {
            VStack {
                Image(safetyTip.image)
                    .resizable()
                    //.frame(width: .infinity, height: 150, alignment: .center)
                    //.clipped()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
                
                Text(LocalizedStringKey(safetyTip.title))
                    .font(Font.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()
                                 
                GroupBox {
                    VStack {

                        Text(safetyTip.getDescriptionWithBabyname(babyName: model.babyName))
                            .padding(.bottom, 8)
                            .font(.body)
                    }
                }

                GroupBox(label: Label(LocalizedStringKey("product_recommendations"), systemImage: "link")) {
                    ForEach(safetyTip.getSafetyTipLinksForShop(shop: selectedShop))  { safetyTipLink in
                        Link(destination: safetyTipLink.link) {
                            Label(LocalizedStringKey(safetyTipLink.text), systemImage: "cart")
                        }.padding(8)
                    }
                }
            }.padding()
        }
        .navigationTitle(LocalizedStringKey(safetyTip.title))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            Button(action: {
                self.isShareSheetPresented = true
            }) {
                Label("share", systemImage: "square.and.arrow.up")
              }
        })
        .sheet(isPresented: $isShareSheetPresented, onDismiss: {
          print("Dismiss")
          self.isShareSheetPresented = false

          }, content: {
              ActivityViewController(activityItems: [safetyTip.getShareText(shop: selectedShop)])
          }).onAppear {
                if(model.unreadTips.contains(safetyTip.id)) {
                    let index = model.safetyTips.firstIndex(where: { st in
                        safetyTip.id == st.id
                    })
                    model.safetyTips[index!].isUnread = false
                    model.saveUnreadTips()
                    UIApplication.shared.applicationIconBadgeNumber = model.numUnread   // update app icon badge
                }
            }
    }
}

struct MainTipDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainTipDetailView(safetyTip: .constant(SafetyTip.allSafetyTips.first!), selectedShop: .constant(.amazonDE))
            .environmentObject(BabysafeViewModel())
    }
}
