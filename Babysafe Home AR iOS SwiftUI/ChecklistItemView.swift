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
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(.green)
                            .transition(.scale)
                            .padding(4)
                    } else {
                        Image(systemName: "cross")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(.red)
                            .transition(.scale)
                            .padding(4)
                    }
                }.animation(.spring(), value: babyDanger.isBanned)
                
                Text(NSLocalizedString(babyDanger.title, comment: ""))
                    .bold()
                    .font(.title3)
                
                Spacer()

            }.padding(.top, 8).padding(.bottom, 4)
                
            
            Text(babyDanger.getDescriptionWithBabyname(babyName: model.babyName))
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


struct ChecklistItemView2_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistItemView(
            babyDanger: .constant(BabyDanger.allBabyDangers[2]),
            selectedShop: .constant(Shop.amazonDE)
        ).environmentObject(BabysafeViewModel())
    }
}
