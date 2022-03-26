//
//  MainChecklistView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 26.03.22.
//

import SwiftUI

struct MainChecklistView: View {
    var body: some View {
        ScrollView {
                Spacer()
                VStack(alignment: .center) {
                    
                    HStack {
                        Image("cat_superman")
                            .resizable()
                            .frame(width: 100.0, height: 100.0)
                        Spacer()
                        Text("checklist_header")
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    List() {
                        Section(header: Text("Found Dangers")) {
                            Text("content...")
                            Text("content...")
                            Text("content...")
                        }
                    }.scaledToFill()
                    
                }
            }
    }
}

struct MainChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        MainChecklistView()
    }
}
