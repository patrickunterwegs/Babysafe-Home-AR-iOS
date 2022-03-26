//
//  MainView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 25.03.22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
                
            TabView {
                MainIntroView()
                    .tabItem {
                        Image(systemName: "dot.circle.viewfinder")
                        Text("main_tab_intro")
                    }
                MainChecklistView()
                    .badge(10)
                    .tabItem {
                        Image(systemName: "checklist")
                        Text("main_tab_checklist")
                    }
                MainScoreView()
                    .tabItem {
                        Image(systemName: "star")
                        Text("main_tab_score")
                    }
                MainTipsView()
                    .badge(1)
                    .tabItem {
                        Image(systemName: "lightbulb")
                        Text("main_tab_tips")
                    }
                AboutView()
                    .tabItem {
                        Image(systemName: "ellipsis")
                        Text("More")
                    }
            }
            .font(.headline)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct MainView_Previews_DE: PreviewProvider {
    static var previews: some View {
        MainView()
            .environment(\.locale, .init(identifier: "de"))
    }
}
