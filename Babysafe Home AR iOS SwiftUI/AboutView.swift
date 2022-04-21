//
//  AboutView.swift
//  iOSTemplate
//
//  Created by Patrick Lang on 20.03.22.
//

import SwiftUI
import Foundation

struct AboutView: View {
    
    @EnvironmentObject var model: BabysafeViewModel
    
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
                    Picker("dialog_shop_select_country", selection: $model.selectedCountry) {
                        ForEach(ShopCountry.allCases.sorted{ $0.name < $1.name }) { country in
                            Text(country.name).tag(country.id)
                        }
                    }.onChange(of: model.selectedCountry) { country in
                        model.selectedShop = getDefaultShopForCountry(country: model.selectedCountry)
                    }
                    Picker("dialog_shop_select_shop", selection: $model.selectedShop) {
                        ForEach(model.selectedCountry.shops) { shop in
                            Text(shop.name).tag(shop.id)
                        }
                    }
                }
                Section(header: Text("settings_camera"), footer: Text("ar_ignore_banned_message")) {
                    Toggle(isOn: $model.ignoreUnlocked) {
                        Label("ar_ignore_unlocked", systemImage: "cross")
                    }
                    Toggle(isOn: $model.ignoreBanned) {
                        Label("ar_ignore_banned", systemImage: "checkmark.seal")
                    }
                }
                
                
                Section() {
                    Button(action: {
                        self.isTellAFriendPresented = true
                    }) {
                        Label("menu_main_bottombar_recommend", systemImage: "star.bubble")
                      }.sheet(isPresented: $isTellAFriendPresented, onDismiss: {
                        //print("Dismiss")
                        self.isTellAFriendPresented = false
                        }, content: {
                            ActivityViewController(activityItems: [
                                shareText
                                //URL(string: "https://www.orf.at")!
                            ])
                        })
                }
                Section(header: Text("about_app")) {
                    NavigationLink(destination: AboutAppInfoView()) {
                        Label("about_app_info", systemImage: "info.circle")
                    }
                    NavigationLink(destination: AboutLibrariesView()) {
                        Label("about_tab_libraries", systemImage: "chevron.left.forwardslash.chevron.right")
                    }
                    NavigationLink(destination: AboutAttributionsView()) {
                        Label("about_tab_attributions", systemImage: "c.circle")
                    }
                    NavigationLink(destination: AboutThanksView()) {
                        Label("about_tab_thanks", systemImage: "hands.sparkles")
                    }
                    NavigationLink(destination: AboutDisclaimerView()) {
                        Label("menu_main_bottombar_disclaimer", systemImage: "exclamationmark.bubble")
                    }
                }
                Section(header: Text("about_legal_support")) {
                    Link("about_technical_support", destination: Foundation.URL(string: "https://babysafe.techbee.at/support")!)
                    Link("about_app_terms", destination: Foundation.URL(string: "https://babysafe.techbee.at/terms-conditions")!)
                    Link("about_privacy_policy", destination: Foundation.URL(string: "https://babysafe.techbee.at/privacy-policy")!)
                }
            }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().environmentObject(BabysafeViewModel())
    }
}
