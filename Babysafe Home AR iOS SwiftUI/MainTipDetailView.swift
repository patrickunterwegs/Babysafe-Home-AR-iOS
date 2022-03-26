//
//  MainTipDetailView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 26.03.22.
//

import SwiftUI

struct MainTipDetailView: View {
    var body: some View {
        ScrollView {
            GroupBox {
                VStack {

                    Text("tip_electricity_text")
                        .padding(.bottom, 8)
                        .font(.body)
                    
                    HStack {
                        Spacer()
                        Button(action: {}) {
                                Label("share", systemImage: "square.and.arrow.up")
                              }
                            .buttonStyle(.automatic)
                            .buttonBorderShape(.automatic)
                            .padding(4)
                        Button(action: {}) {
                                Label("checklist_item_buy", systemImage: "cart")
                              }
                            .buttonStyle(.automatic)
                            .buttonBorderShape(.automatic)
                            .padding(4)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("tip_electricity_title")

    }
}

struct MainTipDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainTipDetailView()
    }
}
