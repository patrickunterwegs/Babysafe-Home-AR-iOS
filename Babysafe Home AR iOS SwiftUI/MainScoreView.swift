//
//  MainScoreView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 26.03.22.
//

import SwiftUI

struct MainScoreView: View {
    var body: some View {
        ScrollView {
            Spacer()
            VStack(alignment: .center) {
                
                HStack {
                    Badge(image: "ic_badge_unlocked", text: "score_badge_unlocked")
                    Badge(image: "ic_badge_banned", text: "score_badge_banned")
                    Badge(image: "ic_badge_articles", text: "score_badge_articles")
                }.padding()

                GroupBox {
                    Text("score_score_header")
                        .font(.title)
                    ProgressBar(progress: 0.23)
                        .frame(width: 200, height: 200, alignment: .center)
                        .padding()
                    

                    Image("astronaut_phone")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                    Text("score_nothing_unlocked_header")
                        .font(.title)
                        .bold()
                    Text("score_nothing_unlocked_text")
                        .padding()
                        .multilineTextAlignment(.center)
                }.padding()
            }
        }
    }
}

struct MainScoreView_Previews: PreviewProvider {
    static var previews: some View {
        MainScoreView()
    }
}




struct Badge: View {
    
    var image: String
    var text: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 100.0, height: 100.0)
            Text(LocalizedStringKey("score_badge_unlocked")).frame(width: 100, height: nil, alignment: .center)
        }
    }
}


struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge(
        image: "ic_badge_unlocked", text: "score_badge_unlocked")
    }
}


struct ProgressBar: View {
    @State var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(Color.red)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            Text(String(format: "%.0f", min(self.progress, 1.0)*100.0))
                //.font(.largeTitle)
                .font(.custom("progress", size: 72))
                .bold()
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    
    static var previews: some View {
        ProgressBar(progress: 0.23)
    }
}
