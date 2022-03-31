//
//  MainChecklistView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 26.03.22.
//

import SwiftUI

struct MainChecklistView: View {
    
    @EnvironmentObject var model: BabysafeViewModel

    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                HStack {
                    Spacer()
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
                
                ForEach($model.babyDangers) { $babyDanger in
                    if babyDanger.isUnlocked {
                        ChecklistItemView(babyDanger: $babyDanger, selectedShop: $model.selectedShop)
                    }
                }
            }
        }
    }
}

struct MainChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        MainChecklistView().environmentObject(BabysafeViewModel())
    }
}

