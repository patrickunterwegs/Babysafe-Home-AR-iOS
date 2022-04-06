//
//  ChecklistItemView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 31.03.22.
//

import SwiftUI


struct ChecklistItemView: View {
    
    @Binding var babyDanger: BabyDanger
    @Binding var selectedShop: Shop
    //@State private var babyname: String = "Your baby"
    
    @State private var isShareSheetPresented: Bool = false
    
    @EnvironmentObject var model: BabysafeViewModel
    
    
    var body: some View {
                
        GroupBox {
        VStack {
            HStack {

                ZStack {
                    if babyDanger.isBanned {
                        Image(systemName: "checkmark.seal")
                            .imageScale(.large)
                            .foregroundColor(.green)
                            .transition(.scale)
                    } else {
                        Image(systemName: "cross")
                            .imageScale(.large)
                            .foregroundColor(.red)
                            .transition(.scale)
                    }
                }.animation(.interactiveSpring())
                
                Text(LocalizedStringKey(babyDanger.title))
                    .bold()
                    .font(.title3)
                
                Spacer()
                /*
                Button(action: {
                    babyDanger.isBanned.toggle()
                    model.saveToDataStore()
                }) {
                    switch babyDanger.isBanned {
                        case true: Label("Banned", systemImage: "checkmark.seal")
                        default: Label("Ban", systemImage: "bandage")
                    }
                }
                 */
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
        }
        .padding()
        .onTapGesture {
            babyDanger.isBanned.toggle()
            model.saveBanned()
        }
    }
}


struct ChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistItemView(
            babyDanger: .constant(BabyDanger.allBabyDangers.first!),
            selectedShop: .constant(Shop.amazonDE)
        ).environmentObject(BabysafeViewModel())
    }
}
