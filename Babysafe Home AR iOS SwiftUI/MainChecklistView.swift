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
                
                ChecklistHeader()
                
                ForEach($model.babyDangers) { $babyDanger in
                    if babyDanger.isUnlocked {
                        ChecklistItemView(babyDanger: $babyDanger, selectedShop: $model.selectedShop)
                    }
                }
                
                Text("checklist_tap_to_ban").font(.caption).multilineTextAlignment(.center)
            }
        }
    }
}

struct MainChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        MainChecklistView().environmentObject(BabysafeViewModel())
    }
}



struct ChecklistHeader: View {
    
    @EnvironmentObject var model: BabysafeViewModel
    

    
    var body: some View {
        HStack {
            Spacer()
            Image("cat_superman")
                .resizable()
                .frame(width: 100.0, height: 100.0)
            Spacer()
            VStack {

                if model.percentUnlocked >= BabysafeViewModel.Constant.unlockAllThreshold && model.percentUnlocked < 100 {
                    Text("checklist_unlock_info")
                        .multilineTextAlignment(.center)
                        .font(.body)
                } else if model.percentUnlocked == 100 && model.percentBanned < 100  {
                    Text("checklist_all_unlocked")
                        .multilineTextAlignment(.center)
                        .font(.body)
                } else if model.percentUnlocked == 100 && model.percentBanned == 100  {
                    Text("checklist_all_banned")
                        .multilineTextAlignment(.center)
                        .font(.body)
                } else {
                    Text("checklist_header")
                        .multilineTextAlignment(.center)
                        .font(.body)
                }

                
                if model.percentUnlocked >= 70 && model.percentUnlocked < 99 {
                    Spacer()
                    Button(action: {
                        model.unlockAllDangers()
                    }) {
                        Label("checklist_unlock_button", systemImage: "lock.open")
                      }
                }
            }
            Spacer()
        }.onAppear {
            model.sortBabyDangers()
        }
    }
}

struct ChecklistHeader_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistHeader()
            .environmentObject(BabysafeViewModel())
            .previewLayout(.sizeThatFits)
    }
}

struct ChecklistHeader_70_percent_unlocked_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistHeader()
            .environmentObject({ () -> BabysafeViewModel in
                let model = BabysafeViewModel()
                for i in 0 ... model.babyDangers.count-3 {
                    model.babyDangers[i].isUnlocked = true
                }
                return model
                }())
            .previewLayout(.fixed(width: 400, height: 100))
    }
}

struct ChecklistHeader_all_unlocked_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistHeader()
            .environmentObject({ () -> BabysafeViewModel in
                let model = BabysafeViewModel()
                for i in 0 ... model.babyDangers.count-1 {
                    model.babyDangers[i].isUnlocked = true
                }
                return model
                }())
            .previewLayout(.fixed(width: 400, height: 100))
    }
}

struct ChecklistHeader_all_banned_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistHeader()
            .environmentObject({ () -> BabysafeViewModel in
                let model = BabysafeViewModel()
                for i in 0 ... model.babyDangers.count-1 {
                    model.babyDangers[i].isUnlocked = true
                    model.babyDangers[i].isBanned = true
                }
                return model
                }())
            .previewLayout(.fixed(width: 400, height: 100))
    }
}


