//
//  AboutView.swift
//  iOSTemplate
//
//  Created by Patrick Lang on 20.03.22.
//

import SwiftUI
import Foundation

struct AboutView: View {
    

    @State private var selectedCountry: ShopCountry = .at
    @State private var selectedShop: Shop = .amazonDE
    
    @State private var isTellAFriendPresented: Bool = false
    
    let shareText = NSLocalizedString("share_app_text", comment: "")
    
        
    var body: some View {
            List {
                Section() {
                    HStack {
                        Spacer()
                        Image("astronaut-planets")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150.0, height: 150.0)
                        Spacer()
                    }
                }
                Section(header: Text("dialog_shop_select_title"),
                        footer: Text("dialog_shop_select_message2")) {
                    Text("dialog_shop_select_message").font(.footnote).foregroundColor(.gray)
                    Picker("Country", selection: $selectedCountry) {
                        ForEach(ShopCountry.allCases) { country in
                            Text(country.name).tag(country.id)
                        }
                    }.onChange(of: selectedCountry) { country in
                        selectedShop = selectedCountry.shops.first!
                    }
                    Picker("Shop", selection: $selectedShop) {
                        ForEach(selectedCountry.shops) { shop in
                            Text(shop.name).tag(shop.id)
                        }
                    }
                }
                Section() {
                    Button(action: {
                        self.isTellAFriendPresented = true
                    }) {
                        Label("menu_main_bottombar_recommend", systemImage: "star.bubble")
                      }.sheet(isPresented: $isTellAFriendPresented, onDismiss: {
                        print("Dismiss")
                        self.isTellAFriendPresented = false
                        }, content: {
                            ActivityViewController(activityItems: [
                                shareText
                                //URL(string: "https://www.orf.at")!
                            ])
                        })
                }
                Section(header: Text("App")) {
                    NavigationLink(destination: AboutAppInfoView()) {
                        Label("App Info", systemImage: "info.circle")
                    }
                    Label("Libraries", systemImage: "chevron.left.forwardslash.chevron.right")
                    NavigationLink(destination: AboutAttributionsView()) {
                        Label("Attributions", systemImage: "c.circle")
                    }
                    NavigationLink(destination: AboutThanksView()) {
                        Label("Special Thanks", systemImage: "hands.sparkles")
                    }
                    NavigationLink(destination: AboutDisclaimerView()) {
                        Label("Disclaimer", systemImage: "exclamationmark.bubble")
                    }
                }
                Section(header: Text("Legal &amp; Support")) {
                    Link("Technical Support", destination: Foundation.URL(string: "https://babysafe.techbee.at/support")!)
                    Link("Terms &amp; Conditions", destination: Foundation.URL(string: "https://babysafe.techbee.at/terms-conditions")!)
                    Link("Privacy Policy", destination: Foundation.URL(string: "https://babysafe.techbee.at/privacy-policy")!)
                }
            }
        
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}


