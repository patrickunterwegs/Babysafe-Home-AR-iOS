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
    
    func getPercentUnlocked() -> Float {
        return Float(getNumUnlocked()) / Float(BabyDanger.allBabyDangers.count) * 100
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
    
    func getPercentBanned() -> Float {
        let percent = Float(getNumBanned()) / Float(BabyDanger.allBabyDangers.count) * 100
        return Float(getNumBanned()) / Float(BabyDanger.allBabyDangers.count) * 100
    }

    func getNumUnbanned() -> Int {
        return getNumUnlocked() - getNumBanned()
    }
    
    func getNumSafetyTipsUnlocked() -> Int {
        var numSafetyTipsUnlocked = 0
        
        safetyTips.forEach { safetyTip in
            if safetyTip.isUnlocked {
                numSafetyTipsUnlocked += 1
            }
        }
        return numSafetyTipsUnlocked
    }
    
    func getPercentSafetyTipsUnlocked() -> Float {
        return Float(getNumSafetyTipsUnlocked()) / Float(SafetyTip.allSafetyTips.count) * 100
    }
    
    func getProgressPercent() -> Float {
        
        let maxScore: Float = 100.0
        
        let startScore = maxScore * 0.1
        let maxScoreBanned = maxScore * 0.4
        let maxScoreUnlocked = maxScore * 0.25
        let maxScoreSafetyTips = maxScore * 0.25
        
        
        let progressUnlocked: Float = Float(getNumUnlocked()) / Float(BabyDanger.allBabyDangers.count)
        let progressBanned: Float = Float(getNumBanned()) / Float(BabyDanger.allBabyDangers.count)
        let progressSafetyTipsUnlocked: Float = Float(getNumSafetyTipsUnlocked()) / Float(SafetyTip.allSafetyTips.count)
        
        let score = startScore + maxScoreUnlocked * progressUnlocked + maxScoreBanned * progressBanned + maxScoreSafetyTips * progressSafetyTipsUnlocked
        
        return score
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
