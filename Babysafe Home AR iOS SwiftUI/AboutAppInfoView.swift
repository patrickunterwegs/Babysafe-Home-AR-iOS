//
//  AboutAppInfoView.swift
//  iOSTemplate
//
//  Created by Patrick Lang on 21.03.22.
//

import SwiftUI
import Foundation

struct AboutAppInfoView: View {
    
    let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    let appname = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""

    var body: some View {
            List {
                Section() {
                    HStack {
                        Spacer()
                    VStack(alignment: .center) {
                        Spacer()
                        Image("Babysafe")
                            .resizable()
                            .frame(width: 100.0, height: 100.0)
                        Text(appname)
                            .font(.title2)
                            .bold()
                        Text("Version \(version) (\(build))")
                        Text("Codename: \"Babysafe Rulz\"")
                        Text("about_app_copyright")
                        Spacer()
                        }
                    Spacer()
                    }
                }
                Section() {
                    HStack {
                        Spacer()
                    VStack(alignment: .center) {
                        Spacer()
                        Image("logo_techbee")
                            .resizable()
                            .frame(width: 100.0, height: 100.0)
                        Text("Techbee e.U.")
                        Text("https://techbee.at")
                        Spacer()
                        }
                    Spacer()
                    }
                }
                Section() {
                    HStack {
                        Spacer()
                    VStack(alignment: .center) {
                        Spacer()
                        Text("about_app_in_collab_with")
                        Image("congeso")
                            .resizable()
                            .frame(width: 100.0, height: 100.0)
                        Text("ConGeSo")
                        Text("https://congeso.at")
                        Spacer()
                        }
                    Spacer()
                    }
                }
            }
    }
}

struct AboutAppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AboutAppInfoView()
    }
}
