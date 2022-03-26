//
//  MainTipsView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 26.03.22.
//

import SwiftUI

struct MainTipsView: View {
    var body: some View {
        ScrollView {
                Spacer()
                VStack(alignment: .center) {
                    
                    HStack {
                        Spacer()
                        Text("articles_header_info")
                            .multilineTextAlignment(.center)
                        Spacer()
                        Image("cat_superman")
                            .resizable()
                            .frame(width: 100.0, height: 100.0)

                    }
                    List() {
                        Section(header: Text("main_tab_tips")) {
                            Text("content...")
                            Text("content...")
                            Text("content...")
                        }
                    }.scaledToFill()
                    
                }
        }
    }
}

struct MainTipsView_Previews: PreviewProvider {
    static var previews: some View {
        MainTipsView()
    }
}
