//
//  AboutThanksView.swift
//  Babysafe Home AR
//
//  Created by Patrick Lang on 22.03.22.
//

import SwiftUI

struct AboutThanksView: View {
    var body: some View {
        List {
            Section(header: Text("thanks_header")) {
                HStack {
                    Spacer()
                VStack(alignment: .center) {
                    Spacer()
                    Image("penguin_sleeping")
                        .resizable()
                        .frame(width: 150.0, height: 150.0)
                    Spacer()
                    Text("thanks_header")
                        .font(.title)
                        .padding(.bottom)
                    Spacer()
                    Text("thanks_text")
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

struct AboutThanksView_Previews: PreviewProvider {
    static var previews: some View {
        AboutThanksView()
    }
}
