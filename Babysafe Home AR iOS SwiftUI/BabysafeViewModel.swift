//
//  BabysafeViewModel.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 30.03.22.
//

import Foundation
import BottomSheet


class BabysafeViewModel: ObservableObject {
    
    @Published var selectedCountry: ShopCountry = .at
    @Published var selectedShop: Shop = .amazonDE
    @Published var babyDangers: [BabyDanger] = BabyDanger.allBabyDangers
    @Published var safetyTips: [SafetyTip] = SafetyTip.allSafetyTips

    
    @Published var newDangerDetected = false
    @Published var bottomSheetPosition: BottomSheetPosition = .hidden    // for CameraView


    
    
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
            if babyDangers[i].objectIds.contains(objectId) && !babyDangers[i].isCurDetected && !babyDangers[i].isUnlocked {      // notify only when danger was not unlocked yet
                babyDangers[i].isUnlocked = true
                babyDangers[i].isCurDetected = true
                dangerDetected = true
            }
        }
        newDangerDetected = dangerDetected      // we notify newDangerDetected only once!
        saveToDataStore()
    }
    
    func resetCurDetected() {
        for i in 0 ... babyDangers.count-1 {
            babyDangers[i].isCurDetected = false
        }
        newDangerDetected = false
    }
    
    func loadFromDataStore() {
        ModelDataStore.load(datastore: .unlockedDangers) { result in
            switch result {
                case .failure(let error):
                    fatalError(error.localizedDescription)
                case .success(let unlockedDangers): do {
                    unlockedDangers.forEach { unlockedDanger in
                        for i in 0 ... self.babyDangers.count-1 {
                            if unlockedDanger == self.babyDangers[i].id {
                                self.babyDangers[i].isUnlocked = true
                            }
                        }
                    }
                }
            }
        }
        
        ModelDataStore.load(datastore: .bannedDangers) { result in
            switch result {
                case .failure(let error):
                    fatalError(error.localizedDescription)
                case .success(let bannedDangers): do {
                    bannedDangers.forEach { bannedDanger in
                        for i in 0 ... self.babyDangers.count-1 {
                            if bannedDanger == self.babyDangers[i].id {
                                self.babyDangers[i].isBanned = true
                            }
                        }
                    }
                }
            }
        }
        
        
        
        //TODO: Handle articles
    }
    
    func saveToDataStore() {
        
        var unlockedDangersArray: [String] = []
        var bannedDangersArray: [String] = []
        
        self.babyDangers.forEach { babyDanger in
            if babyDanger.isUnlocked {
                unlockedDangersArray.append(babyDanger.id)
            }
            if babyDanger.isBanned {
                bannedDangersArray.append(babyDanger.id)
            }
        }

        ModelDataStore.save(datastore: .unlockedDangers, data: unlockedDangersArray)  { result in
            if case .failure(let error) = result {
                fatalError(error.localizedDescription)
            }
        }
        ModelDataStore.save(datastore: .bannedDangers, data: bannedDangersArray)  { result in
            if case .failure(let error) = result {
                fatalError(error.localizedDescription)
            }
        }
        
        //TODO: Handle articles
    }
}
