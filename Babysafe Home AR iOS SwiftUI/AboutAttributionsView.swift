//
//  AboutAttributionsView.swift
//  Babysafe Home AR
//
//  Created by Patrick Lang on 22.03.22.
//

import SwiftUI

struct AboutAttributionsView: View {
    var body: some View {
        List {
            Section() {
                HStack {
                    Spacer()
                VStack(alignment: .center) {
                    Spacer()
                    Image("astronaut_banner")
                        .resizable()
                        .frame(width: 150.0, height: 150.0)
                    Spacer()
                    Text("attributions_header")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    Spacer()
                    Text("attributions_text")
                        .font(.body)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                Spacer()
                }
            }
            Section(header: Text("attributions_animations")) {
                Text("attributions_lottie_animations_text")
                Text("Star Blast (Selva Kumar S S)\nhttps://lottiefiles.com/61280-star-blast")
                Text("Rainbow (Jorge César)\nhttps://lottiefiles.com/24448-rainbow")
                Text("Confetti (Emas Didik Prasetyo)\nhttps://lottiefiles.com/74694-confetti")
            }
            Section(header: Text("attributions_graphics")) {
                Text("attributions_graphics_text")
            }
        }
    }
}

struct AboutAttributionsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutAttributionsView()
    }
}
