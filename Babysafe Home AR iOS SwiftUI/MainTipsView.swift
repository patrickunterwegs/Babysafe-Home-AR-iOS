//
//  MainTipsView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 26.03.22.
//

import SwiftUI

struct MainTipsView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {



                    List {
                        NavigationLink(destination: MainTipDetailView()) {
                            Text("tip_electricity_title")
                        }
                        NavigationLink(destination: MainTipDetailView()) {
                            Text("tip_electricity_title")
                        }
                        NavigationLink(destination: MainTipDetailView()) {
                            Text("tip_electricity_title")
                            Spacer()
                            Image(systemName: "circlebadge.fill").foregroundColor(.yellow)
                        }
                    }
                
                Spacer()
                HStack {
                    Spacer()
                    Text("articles_header_info")
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    Image("biddy_badge")
                        .resizable()
                        .frame(width: 100.0, height: 100.0)
                }
            }.navigationTitle("main_tab_tips")
        }
    }
}

struct MainTipsView_Previews: PreviewProvider {
    static var previews: some View {
        MainTipsView()
    }
}
