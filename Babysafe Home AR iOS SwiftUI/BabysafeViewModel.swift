//
//  BabysafeViewModel.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 30.03.22.
//

import Foundation
import SwiftUI
import UserNotifications

class BabysafeViewModel: ObservableObject {
    
    @AppStorage("selectedCountry") var selectedCountry: ShopCountry = getDefaultCountry()
    @AppStorage("selectedShop") var selectedShop: Shop = getDefaultShopForCountry(country: getDefaultCountry())
    
    @AppStorage("ignoreUnlocked") var ignoreUnlocked = false
    @AppStorage("ignoreBanned") var ignoreBanned = false
    
    @AppStorage("babyName") var babyName = NSLocalizedString("intro_default_baby_name", comment: "")
    @AppStorage("nextTipUnlockTime") var lastTipUnlockTime: Double = 0
    
    @AppStorage("userColor") var userColor: Color = .blue

    
    
    var unlockedDangers: [String] = (UserDefaults.standard.stringArray(forKey: Constant.unlockedDangersKey) ?? ["POWER"])
    var bannedDangers: [String] = (UserDefaults.standard.stringArray(forKey: Constant.bannedDangersKey) ?? [])
    var unlockedTips: [String] = (UserDefaults.standard.stringArray(forKey: Constant.unlockedTipsKey) ?? ["ELECTRICITY"])
    var unreadTips: [String] = (UserDefaults.standard.stringArray(forKey: Constant.unreadTipsKey) ?? ["ELECTRICITY"])
    

    @Published var babyDangers: [BabyDanger] = BabyDanger.allBabyDangers
    @Published var safetyTips: [SafetyTip] = SafetyTip.allSafetyTips

    
    @Published var newDangerDetected = false
    @Published var showUnlockRemainingAlert = false
    
    @Published var isCameraPermissionGranted = true

    

    
    var numUnlocked: Int {
        var numUnlocked = 0
        babyDangers.forEach { babyDanger in
            if babyDanger.isUnlocked {
                numUnlocked += 1
            }
        }
        return numUnlocked
    }
    
    var percentUnlocked: Float {
        return Float(numUnlocked) / Float(BabyDanger.allBabyDangers.count) * 100
    }
    

    var numBanned: Int {
        var numBanned = 0
        babyDangers.forEach { babyDanger in
            if babyDanger.isBanned {
                numBanned += 1
            }
        }
        return numBanned
    }
    
    var percentBanned: Float {
        return Float(numBanned) / Float(BabyDanger.allBabyDangers.count) * 100
    }

    var numUnbanned: Int {
        return numUnlocked - numBanned
    }
    
    var numSafetyTipsUnlocked: Int {
        var numSafetyTipsUnlocked = 0
        
        safetyTips.forEach { safetyTip in
            if safetyTip.isUnlocked {
                numSafetyTipsUnlocked += 1
            }
        }
        return numSafetyTipsUnlocked
    }
    
    var percentSafetyTipsUnlocked: Float {
        return Float(numSafetyTipsUnlocked) / Float(SafetyTip.allSafetyTips.count) * 100
    }
    
    var progressPercent: Float {
        
        let maxScore: Float = 100.0
        
        let startScore = maxScore * 0.1
        let maxScoreBanned = maxScore * 0.4
        let maxScoreUnlocked = maxScore * 0.25
        let maxScoreSafetyTips = maxScore * 0.25
        
        
        let progressUnlocked: Float = Float(numUnlocked) / Float(BabyDanger.allBabyDangers.count)
        let progressBanned: Float = Float(numBanned) / Float(BabyDanger.allBabyDangers.count)
        let progressSafetyTipsUnlocked: Float = Float(numSafetyTipsUnlocked) / Float(SafetyTip.allSafetyTips.count)
        
        let score = startScore + maxScoreUnlocked * progressUnlocked + maxScoreBanned * progressBanned + maxScoreSafetyTips * progressSafetyTipsUnlocked
        
        return score
    }
    
    var numUnread: Int {
        
        var numUnread = 0
        safetyTips.forEach { safetyTip in
            if safetyTip.isUnread {
                numUnread += 1
            }
        }
        return numUnread
    }
    
    
    
    
    func unlock(objectId: Int) {
        
        var dangerDetected = false
       
        for i in 0 ... babyDangers.count-1 {
            if babyDangers[i].objectIds.contains(objectId)
                && !babyDangers[i].isCurDetected
                && (!babyDangers[i].isUnlocked || (babyDangers[i].isUnlocked && !ignoreUnlocked))
                && (!babyDangers[i].isBanned || (babyDangers[i].isBanned && !ignoreBanned))
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
    
    func unlockAllDangers() {
        
        for i in 0 ... babyDangers.count-1 {
            babyDangers[i].isUnlocked = true
        }
        saveUnlocked()
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
        sortBabyDangers()
        
        unlockedTips.forEach { unlockedTip in
            for i in 0 ... self.safetyTips.count-1 {
                if unlockedTip == self.safetyTips[i].id {
                    self.safetyTips[i].isUnlocked = true
                }
            }
        }
        
        unreadTips.forEach { unreadTip in
            for i in 0 ... self.safetyTips.count-1 {
                if unreadTip == self.safetyTips[i].id {
                    self.safetyTips[i].isUnread = true
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
        UserDefaults.standard.set(unlockedDangers, forKey: Constant.unlockedDangersKey)
    }
    
    func saveBanned() {
        
        bannedDangers.removeAll()
        self.babyDangers.forEach { babyDanger in
            if babyDanger.isBanned {
                bannedDangers.append(babyDanger.id)
            }
        }
        UserDefaults.standard.set(bannedDangers, forKey: Constant.bannedDangersKey)
    }
    
    func saveUnlockedTips() {
        
        unlockedTips.removeAll()
        self.safetyTips.forEach { safetyTip in
            if safetyTip.isUnlocked {
                unlockedTips.append(safetyTip.id)
            }
        }
        UserDefaults.standard.set(unlockedTips, forKey: Constant.unlockedTipsKey)
    }
    
    func saveUnreadTips() {
        
        unreadTips.removeAll()
        self.safetyTips.forEach { safetyTip in
            if safetyTip.isUnread {
                unreadTips.append(safetyTip.id)
            }
        }
        UserDefaults.standard.set(unreadTips, forKey: Constant.unreadTipsKey)
    }
    
    func unlockSafetyTipIfAvailable() {
        
        if lastTipUnlockTime == 0 {
            lastTipUnlockTime = Date().timeIntervalSince1970   // only for first initialization
        }
        
        if Date() >= Date(timeIntervalSince1970: lastTipUnlockTime).addingTimeInterval(Constant.nextTipUnlockInterval) {
            for i in 0...safetyTips.count-1 {
                if safetyTips[i].isUnlocked {
                    continue
                } else {
                    safetyTips[i].isUnlocked = true
                    safetyTips[i].isUnread = true
                    saveUnlockedTips()
                    saveUnreadTips()
                    //self.objectWillChange.send()
                    lastTipUnlockTime = Date().timeIntervalSince1970
                    prepareNotification()
                    break   // we stop the loop here (we unlock only one tip)
                }
            }
        }
    }
    
    
    func prepareNotification() {
        
        let current = UNUserNotificationCenter.current()

        current.getNotificationSettings(completionHandler: { (settings) in
            if settings.authorizationStatus == .notDetermined {
                // Notification permission has not been asked yet, go for it!
                current.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("Notification permission granted")
                        scheduleNotification()
                        DispatchQueue.main.async {
                            UIApplication.shared.applicationIconBadgeNumber = self.numUnread   // update app icon badge
                        }
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            } else if settings.authorizationStatus == .denied {
                // Notification permission was previously denied, go to settings & privacy to re-enable - do nothing
            } else if settings.authorizationStatus == .authorized {
                scheduleNotification()
            }
        })
        
        
        
        // inner function
        func scheduleNotification() {
            
            // find next safety tip to unlock
            for i in 0...safetyTips.count-1 {
                if safetyTips[i].isUnlocked {
                    continue
                } else {

                    // a safety tip was found, that was not unlocked, we schedule a  notification.
                    let content = UNMutableNotificationContent()
                    content.title = NSLocalizedString("articles_notification_title", comment: "")
                    content.subtitle = "\"" + NSLocalizedString(self.safetyTips[i].title, comment: "") + "\""
                    content.sound = UNNotificationSound.default
                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Constant.nextTipUnlockInterval, repeats: false)
                    let request = UNNotificationRequest(identifier: self.safetyTips[i].id, content: content, trigger: trigger)
                    
                    UNUserNotificationCenter.current().add(request)
                    break   // we stop the loop here (we schedule only one notification)
                }
            }
        }
    }
    
    func sortBabyDangers() {
        babyDangers.sort { $0.isBanned == false && $1.isBanned == true }
    }
    
    
    enum Constant {
        static let unlockedDangersKey = "unlockedDangers"
        static let bannedDangersKey = "bannedDangers"
        static let unlockedTipsKey = "unlockedTips"
        static let unreadTipsKey = "unreadTips"
        static let userColor = "userColor"
        
        static let nextTipUnlockInterval: TimeInterval = 1*60*60*24     // time interval are always seconds!
        
        static let unlockAllThreshold: Float = 70.0
    }

}



// extension for color to allow saving in AppStorage

extension Color: RawRepresentable {

    public init?(rawValue: String) {
        
        guard let data = Data(base64Encoded: rawValue) else{
            self = .blue
            return
        }
        
        do {
            let color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor ?? .black
            self = Color(color)
        } catch { self = .blue }
    }

    public var rawValue: String {
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: UIColor(self), requiringSecureCoding: false) as Data
            return data.base64EncodedString()
            
        } catch { return "" }
    }
}
