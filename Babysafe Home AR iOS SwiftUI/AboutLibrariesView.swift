//
//  AboutLibrariesView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 10.04.22.
//

import SwiftUI
import Foundation

struct AboutLibrariesView: View {
    var body: some View {
        List {
            Section() {
                HStack {
                    Spacer()
                VStack(alignment: .center) {
                    Spacer()
                    Image("astronaut_computer")
                        .resizable()
                        .frame(width: 150.0, height: 150.0)
                    Spacer()
                    Text("libraries_header")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    Spacer()
                    Text("libraries_text")
                        .font(.body)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                Spacer()
                }
            }

            Section(header: Text("about_tab_libraries")) {
                Link(destination: URL(string: "https://developers.google.com/ml-kit")!) {
                    Label(String("Google ML Kit"), systemImage: "link")
                }
                Link(destination: URL(string: "https://github.com/simibac/ConfettiSwiftUI")!) {
                    Label(String("ConfettiSwiftUI"), systemImage: "link")
                }
            }
            
        }
    }
}

struct AboutLibrariesView_Previews: PreviewProvider {
    static var previews: some View {
        AboutLibrariesView()
    }
}
