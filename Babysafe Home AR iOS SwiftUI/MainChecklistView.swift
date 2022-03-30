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
                        ChecklistItem(babyDanger: $babyDanger, selectedShop: $model.selectedShop)
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


struct ChecklistItem: View {
    
    @Binding var babyDanger: BabyDanger
    @Binding var selectedShop: Shop
    
    @State private var babyname: String = "Your baby"
    
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
                    babyDanger.isBanned = !babyDanger.isBanned
                }) {
                    switch babyDanger.isBanned {
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
                        ActivityViewController(activityItems: [babyDanger.getShareText(shop: selectedShop)])
                    }).padding(8)
                
                let link = babyDanger.getLinkForShop(shop: selectedShop)
                if(link != nil) {
                    Link(destination: link!) {
                        Label("checklist_item_buy", systemImage: "cart")
                    }.padding(8)
                }
            }
        }
        }.padding()
    }
}


struct ChecklistItem_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistItem(
            babyDanger: .constant(BabyDanger.allBabyDangers.first!),
            selectedShop: .constant(Shop.amazonDE)
        )
    }
}
