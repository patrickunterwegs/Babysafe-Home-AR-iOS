//
//  BabysafeViewModel.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 30.03.22.
//

import Foundation
import SwiftUI


class BabysafeViewModel: ObservableObject {
    
    @AppStorage("selectedCountry") var selectedCountry: ShopCountry = .at
    @AppStorage("selectedShop") var selectedShop: Shop = .amazonDE
    
    @AppStorage("findUnlocked") var findUnlocked = true
    @AppStorage("findBanned") var findBanned = true
    
    var unlockedDangers: [String] = (UserDefaults.standard.stringArray(forKey: "unlockedDangers") ?? [])
    var bannedDangers: [String] = (UserDefaults.standard.stringArray(forKey: "bannedDangers") ?? [])
    var unlockedTips: [String] = (UserDefaults.standard.stringArray(forKey: "unlockedTips") ?? [])

    @Published var babyDangers: [BabyDanger] = BabyDanger.allBabyDangers
    @Published var safetyTips: [SafetyTip] = SafetyTip.allSafetyTips

    
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
            if babyDangers[i].objectIds.contains(objectId)
                && !babyDangers[i].isCurDetected
                && (!babyDangers[i].isUnlocked || (babyDangers[i].isUnlocked && findUnlocked))
                && (!babyDangers[i].isBanned || (babyDangers[i].isBanned && findBanned))
                && !babyDangers[i].isDetectedInSession {
                
                babyDangers[i].isUnlocked = true
                babyDangers[i].isCurDetected = true
                babyDangers[i].isDetectedInSession = true
                dangerDetected = true
            }
        }
        if dangerDetected {
            saveUnlocked()
            newDangerDetected = true      // we notify newDangerDetected only once!
        }
    }
    
    func resetCurDetected() {
        for i in 0 ... babyDangers.count-1 {
            babyDangers[i].isCurDetected = false
        }
        newDangerDetected = false
    }
    
    func resetIsDetectedInSession() {
        for i in 0 ... babyDangers.count-1 {
            babyDangers[i].isDetectedInSession = false
        }
    }
    
    
    func loadFromUserDefaults() {
        
        unlockedDangers.forEach { unlockedDanger in
            for i in 0 ... self.babyDangers.count-1 {
                if unlockedDanger == self.babyDangers[i].id {
                    self.babyDangers[i].isUnlocked = true
                }
            }
        }
        
        bannedDangers.forEach { bannedDanger in
            for i in 0 ... self.babyDangers.count-1 {
                if bannedDanger == self.babyDangers[i].id {
                    self.babyDangers[i].isBanned = true
                }
            }
        }
        
        unlockedTips.forEach { unlockedTip in
            for i in 0 ... self.safetyTips.count-1 {
                if unlockedTip == self.safetyTips[i].id {
                    self.safetyTips[i].isUnlocked = true
                }
            }
        }
    }
    
    func saveUnlocked() {
        
        unlockedDangers.removeAll()
        self.babyDangers.forEach { babyDanger in
            if babyDanger.isUnlocked {
                unlockedDangers.append(babyDanger.id)
            }
        }
        UserDefaults.standard.set(unlockedDangers, forKey: "unlockedDangers")
    }
    
    func saveBanned() {
        
        bannedDangers.removeAll()
        self.babyDangers.forEach { babyDanger in
            if babyDanger.isBanned {
                bannedDangers.append(babyDanger.id)
            }
        }
        UserDefaults.standard.set(bannedDangers, forKey: "bannedDangers")
    }
    
    func saveUnlockedTips() {
        
        unlockedTips.removeAll()
        self.safetyTips.forEach { safetyTip in
            if safetyTip.isUnlocked {
                unlockedTips.append(safetyTip.id)
            }
        }
        UserDefaults.standard.set(unlockedTips, forKey: "unlockedTips")
    }
}
