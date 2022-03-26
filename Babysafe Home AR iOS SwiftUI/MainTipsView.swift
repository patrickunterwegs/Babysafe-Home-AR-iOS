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
                HStack {
                    Spacer()
                    Text("articles_header_info")
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    Image("cat_superman")
                        .resizable()
                        .frame(width: 100.0, height: 100.0)
                }

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
            }
            
        }
    }
}

struct MainTipsView_Previews: PreviewProvider {
    static var previews: some View {
        MainTipsView()
    }
}
