//
//  MainView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 25.03.22.
//

import SwiftUI

struct MainView: View {
    
    // creating the view model and storing it as state object and accessible with @EnvironmentObject
    @StateObject var model: BabysafeViewModel = BabysafeViewModel()
    
    @State var isPresentingCameraView = false


    var body: some View {
        
            TabView {
                
                NavigationView {
                    MainIntroView(isPresentingCameraView: $isPresentingCameraView)
                        .navigationTitle("main_tab_intro")
                        .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Image(systemName: "dot.circle.viewfinder")
                    Text("main_tab_intro")
                }
                .navigationViewStyle(StackNavigationViewStyle())
                
                NavigationView {
                    MainChecklistView()
                        .navigationTitle("main_tab_checklist")
                        .navigationBarTitleDisplayMode(.inline)
                }
                .badge(model.numUnbanned)
                .tabItem {
                    Image(systemName: "checklist")
                    Text("main_tab_checklist")
                }
                .navigationViewStyle(StackNavigationViewStyle())
                    
                NavigationView {
                    MainScoreView()
                        .navigationTitle("main_tab_score")
                        .navigationBarTitleDisplayMode(.inline)
                }.tabItem {
                    Image(systemName: "star")
                    Text("main_tab_score")
                }
                .navigationViewStyle(StackNavigationViewStyle())
                
                NavigationView {
                    MainTipsView()
                        .navigationTitle("main_tab_tips")
                        .navigationBarTitleDisplayMode(.inline)
                }
                .badge(model.numUnread)
                .tabItem {
                    Image(systemName: "lightbulb")
                    Text("main_tab_tips")
                }
                .navigationViewStyle(StackNavigationViewStyle())
                
                NavigationView {
                    AboutView()
                        .navigationTitle("more")
                        .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("more")
                }
                .navigationViewStyle(StackNavigationViewStyle())
                
            }
            .font(.headline)
            .sheet(isPresented: $isPresentingCameraView) {
                NavigationView {
                    CameraView()
                        .navigationTitle("ar_camera")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .confirmationAction) {
                                Button("close") {
                                    isPresentingCameraView = false
                                }
                            }
                        }
                }.accentColor(model.userColor)
            }
            .environmentObject(model)
            .onAppear (perform: {
                model.loadFromUserDefaults()
                model.unlockSafetyTipIfAvailable()
            })
            .task {
                await checkForNewSafetyTip()
            }
            .accentColor(model.userColor)
    }
    
    /**
     Check every minute if a new safety tip is available. Otherwise the UI might not get updated after a notification if the app is still running in the background.
     */
    private func checkForNewSafetyTip() async {
            // Delay of 60 seconds (1 second = 1_000_000_000 nanoseconds)
            try? await Task.sleep(nanoseconds: 60_000_000_000)
            model.unlockSafetyTipIfAvailable()
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
