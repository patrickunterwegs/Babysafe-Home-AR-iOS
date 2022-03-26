//
//  AboutView.swift
//  iOSTemplate
//
//  Created by Patrick Lang on 20.03.22.
//

import SwiftUI

struct AboutView: View {
    
    enum Country: String, CaseIterable, Identifiable {
        case austria, germany, switzerland, world
        var id: Self { self }
    }

    enum Shop: String, CaseIterable, Identifiable {
        case amazonDE, babywalzAT, babywalzDE, babywalzCH, aliexpress
        var id: Self { self }
    }
    
    @State private var selectedCountry: Country = .austria
    @State private var selectedShop: Shop = .amazonDE
    
    
        
    var body: some View {
        NavigationView {
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
                    Text("dialog_shop_select_message").font(.footnote)
                    Picker("Country", selection: $selectedCountry) {
                        Text("Austria").tag(Country.austria)
                        Text("Germany").tag(Country.germany)
                        Text("Switzerland").tag(Country.switzerland)
                        Text("World").tag(Country.world)
                    }
                    Picker("Shop", selection: $selectedShop) {
                        Text("Amazon.de").tag(Shop.amazonDE)
                        Text("Baby-Walz.at").tag(Shop.babywalzAT)
                        Text("Baby-Walz.de").tag(Shop.babywalzDE)
                        Text("Baby-Walz.ch").tag(Shop.babywalzCH)
                        Text("AliExpress.com").tag(Shop.aliexpress)
                    }
                }
                Section(header: Text("App")) {
                    NavigationLink(destination: AboutAppInfoView()) {
                        Label("App Info", systemImage: "info.circle")
                    }
                    Label("Tell-a-friend", systemImage: "message")
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
            }.navigationTitle("More")
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}


