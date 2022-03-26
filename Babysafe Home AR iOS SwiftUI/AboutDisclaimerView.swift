//
//  AboutDisclaimerView.swift
//  iOSTemplate
//
//  Created by Patrick Lang on 21.03.22.
//

import SwiftUI

struct AboutDisclaimerView: View {
    var body: some View {
        List {
            Section(header: Text("dialog_disclaimer_title")) {
                HStack {
                    Spacer()
                VStack(alignment: .center) {
                    Spacer()
                    Image("cat_computer")
                        .resizable()
                        .frame(width: 150.0, height: 150.0)
                    Spacer()
                    Text("dialog_disclaimer_title")
                        .font(.title)
                        .padding(.bottom)
                    Spacer()
                    Text("dialog_disclaimer_message")
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    Spacer()
                }
                Spacer()
                }
            }
        }
    }
}

struct AboutDisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        AboutDisclaimerView()
    }
}
