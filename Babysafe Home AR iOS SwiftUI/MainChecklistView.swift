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
                
                ForEach(BabyDanger.allBabyDangers) { babyDanger in
                     ChecklistItem(babyDanger: babyDanger)
                }
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
    
    let babyDanger: BabyDanger
    
    @State private var babyname: String = "Your baby"
    
    @State var isChecked = false
    @State private var isShareSheetPresented: Bool = false
    
    
    var body: some View {
                
        GroupBox {
        VStack {
            HStack {
                Image(systemName: "cross")
                Text(LocalizedStringKey(babyDanger.title))
                    .bold()
                    .font(.title3)
                Spacer()
                Button(action: {
                    isChecked.toggle()
                }) {
                    switch isChecked {
                    case true: Label("Banned", systemImage: "checkmark.seal")
                    default: Label("Ban", systemImage: "bandage")
                    }
                }
            }.padding(.top, 8).padding(.bottom, 4)
            
            Text(LocalizedStringKey(babyDanger.description))
                .font(.body)

            
            HStack {
                Spacer()
                
                Button(action: {
                    self.isShareSheetPresented = true
                }) {
                    Label("share", systemImage: "square.and.arrow.up")
                  }.sheet(isPresented: $isShareSheetPresented, onDismiss: {
                    print("Dismiss")
                    self.isShareSheetPresented = false

                    }, content: {
                        ActivityViewController(activityItems: [getShareText(babyDanger: babyDanger)])
                    }).padding(8)
                
                if(babyDanger.linkAmazonDE != nil) {
                    Link(destination: babyDanger.linkAmazonDE!) {
                        Label("checklist_item_buy", systemImage: "cart")
                    }.padding(8)
                }
            }
        }
        }.padding()
    }

}

func getShareText(babyDanger: BabyDanger) -> String {
    let title = NSLocalizedString(babyDanger.title, comment: "")
    let desc = NSLocalizedString(babyDanger.description, comment: "")
    let addition = NSLocalizedString("share_brought_to_you_by", comment: "")
    return "*\(title)*\n\(desc)\n\n\(addition)"
}

struct ChecklistItem_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistItem(
            babyDanger: BabyDanger.allBabyDangers.first!
        )
    }
}
