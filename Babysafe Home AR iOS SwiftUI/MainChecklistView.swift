//
//  MainChecklistView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 26.03.22.
//

import SwiftUI

struct MainChecklistView: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Image("cat_superman")
                    .resizable()
                    .frame(width: 100.0, height: 100.0)
                Spacer()
                Text("checklist_header")
                    .multilineTextAlignment(.center)
                    .padding()
                    .font(.body)
                Spacer()
            }
            List() {
                ChecklistItem()
                ChecklistItem()
                ChecklistItem()
                ChecklistItem()
                ChecklistItem()
                ChecklistItem()
            }
        }
    }
}

struct MainChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        MainChecklistView()
    }
}


struct ChecklistItem: View {
    var body: some View {
        Section {
        VStack {
            HStack {
                Image(systemName: "cross")
                Text("danger_smallitems_title")
                    .bold()
                    .font(.title3)
                Spacer()
            }.padding(.top, 8).padding(.bottom, 4)
            
            Text("danger_smallitems_text")
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
    }

}


struct ChecklistItem_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistItem()
    }
}
