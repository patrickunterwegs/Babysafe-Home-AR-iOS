//
//  MainScoreView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 26.03.22.
//

import SwiftUI

struct MainScoreView: View {
    
    //@Binding var babyDangers: [BabyDanger]
    @EnvironmentObject var model: BabysafeViewModel

    
    var body: some View {
        ScrollView {
            Spacer()
            VStack(alignment: .center) {

                HStack {
                    Badge(
                        image: "ic_badge_unlocked",
                        text: "score_badge_unlocked",
                        percentReveal: model.getPercentUnlocked()
                    )
                    Badge(
                        image: "ic_badge_banned",
                        text: "score_badge_banned",
                        percentReveal: model.getPercentBanned()
                    )
                    Badge(
                        image: "ic_badge_articles",
                        text: "score_badge_articles",
                        percentReveal: model.getPercentSafetyTipsUnlocked()
                        )
                }.padding()

                GroupBox {
                    Text("score_score_header")
                        .font(.title)
                    ProgressBar(progress: model.getProgressPercent())
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
        }.navigationTitle("main_tab_score")
    }
}

struct MainScoreView_Previews: PreviewProvider {
    static var previews: some View {
        MainScoreView().environmentObject(BabysafeViewModel())
    }
}



struct Badge: View {
    
    var image: String
    var text: String
    var percentReveal: Float
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            ZStack {
                if percentReveal == 100 {
                    Image(image)
                        .resizable()
                        .frame(width: 100.0, height: 100.0)
                } else {
                    Image(image)
                        .resizable()
                        .renderingMode(.template)
                        .colorMultiply(colorScheme == .dark ? .white : .black)
                        .frame(width: 100.0, height: 100.0)
                        .opacity(0.1)
                    Text(String(format: "%.0f%%", percentReveal))
                        .font(.caption)
                        .bold()
                        .frame(width: 100.0, height: 100.0)
                }
            }
            Text(LocalizedStringKey(text)).frame(width: 100, height: nil, alignment: .center).multilineTextAlignment(.center)
        }
    }
}


struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge(image: "ic_badge_unlocked", text: "score_badge_unlocked", percentReveal: 78)
            .previewLayout(.sizeThatFits)
    }
}

struct Badge_Revealed_Previews: PreviewProvider {
    static var previews: some View {
        Badge(image: "ic_badge_unlocked", text: "score_badge_unlocked", percentReveal: 100)
            .previewLayout(.sizeThatFits)
    }
}


struct ProgressBar: View {
    var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(Color.red)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress/100, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 270.0))
                //.animation(.linear)
            Text(String(format: "%.0f", progress))
                //.font(.largeTitle)
                .font(.custom("progress", size: 72))
                .bold()
            LottieView(name: "confetti")
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    
    static var previews: some View {
        ProgressBar(progress: 0.23)
            .previewLayout(.sizeThatFits)
    }
}
