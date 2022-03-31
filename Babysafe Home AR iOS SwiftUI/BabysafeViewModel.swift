//
//  BabysafeViewModel.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 30.03.22.
//

import Foundation

class BabysafeViewModel: ObservableObject {
    
    @Published var selectedCountry: ShopCountry = .at
    @Published var selectedShop: Shop = .amazonDE
    @Published var babyDangers: [BabyDanger] = BabyDanger.allBabyDangers
    
    @Published var newDangerDetected = false

    
    
    func getNumUnlocked() -> Int {
        var numUnlocked = 0
        babyDangers.forEach { babyDanger in
            if babyDanger.isUnlocked {
                numUnlocked += 1
            }
        }
        return numUnlocked
    }

    func getNumBanned() -> Int {
        var numBanned = 0
        babyDangers.forEach { babyDanger in
            if babyDanger.isBanned {
                numBanned += 1
            }
        }
        return numBanned
    }

    func getNumUnbanned() -> Int {
        return getNumUnlocked() - getNumBanned()
    }
    
    func unlock(objectId: Int) {
        
        var dangerDetected = false
       
        for i in 0 ... babyDangers.count-1 {
            if babyDangers[i].objectIds.contains(objectId) && !babyDangers[i].isCurDetected {
                babyDangers[i].isUnlocked = true
                babyDangers[i].isCurDetected = true
                dangerDetected = true
            }
        }
        newDangerDetected = dangerDetected      // we notify newDangerDetected only once!
    }
    
    func resetCurDetected() {
        for i in 0 ... babyDangers.count-1 {
            babyDangers[i].isCurDetected = false
        }
    }
}
