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
            GroupBox {
                VStack {

                    Text(LocalizedStringKey(safetyTip.description))
                        .padding(.bottom, 8)
                        .font(.body)
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.isShareSheetPresented = true
                        }) {
                            Label("share", systemImage: "square.and.arrow.up")
                          }.sheet(isPresented: $isShareSheetPresented, onDismiss: {
                            print("Dismiss")
                            self.isShareSheetPresented = false

                            }, content: {
                                ActivityViewController(activityItems: [safetyTip.getShareText(shop: selectedShop)])
                            }).padding(8)
                    
                        
                        ForEach(safetyTip.getSafetyTipLinksForShop(shop: selectedShop))  { safetyTipLink in
                            
                            Link(destination: safetyTipLink.link) {
                                Label(LocalizedStringKey(safetyTipLink.text), systemImage: "cart")
                            }.padding(8)
                        
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle(LocalizedStringKey(safetyTip.title))
    }
}

struct MainTipDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainTipDetailView(safetyTip: .constant(SafetyTip.allSafetyTips.first!), selectedShop: .constant(.amazonDE))
            .environmentObject(BabysafeViewModel())
    }
}
