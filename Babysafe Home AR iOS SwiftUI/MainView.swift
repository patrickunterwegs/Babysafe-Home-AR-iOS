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
                NavigationView {
                    MainIntroView()
                        .navigationTitle("main_tab_intro")
                        .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Image(systemName: "dot.circle.viewfinder")
                    Text("main_tab_intro")
                }
                
                NavigationView {
                    MainChecklistView()
                        .navigationTitle("main_tab_checklist")
                        .navigationBarTitleDisplayMode(.inline)
                }
                .badge(10)
                .tabItem {
                    Image(systemName: "checklist")
                    Text("main_tab_checklist")
                }
                    
                NavigationView {
                    MainScoreView()
                        .navigationTitle("main_tab_score")
                        .navigationBarTitleDisplayMode(.inline)
                }.tabItem {
                    Image(systemName: "star")
                    Text("main_tab_score")
                }
                
                NavigationView {
                    MainTipsView()
                        .navigationTitle("main_tab_tips")
                        .navigationBarTitleDisplayMode(.inline)
                }
                .badge(1)
                .tabItem {
                    Image(systemName: "lightbulb")
                    Text("main_tab_tips")
                }
                
                NavigationView {
                    AboutView()
                        .navigationTitle("More")
                        .navigationBarTitleDisplayMode(.inline)
                }
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
