//
//  AboutView.swift
//  iOSTemplate
//
//  Created by Patrick Lang on 20.03.22.
//

import SwiftUI

struct AboutView: View {
        
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
                Section(header: Text("Settings")) {
                    Label("Change Shop", systemImage: "cart")
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


