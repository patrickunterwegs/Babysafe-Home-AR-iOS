//
//  BabyDanger.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 28.03.22.
//

import Foundation
import SwiftUI

struct BabyDanger: Identifiable {
    let id: String
    let objectIds: [Int]
    let title: String
    let description: String
    let linkGlobal: URL?
    let linkAmazonDE: URL?
    var isUnlocked: Bool = false
    var isBanned: Bool = false
    var isCurDetected: Bool = false
}

extension BabyDanger {
    static let allBabyDangers: [BabyDanger] =
    [
        BabyDanger(
            id: "POWER",
            objectIds: [255],
            title: String("danger_power_title"),
            description: String("danger_power_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "TOILETWATER",
            objectIds: [125, 457, 459],
            title: String("danger_toiletwater_title"),
            description: String("danger_toiletwater_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "FURNITURE_TIPOVER",
            objectIds: [217, 364, 379, 492],
            title: String("danger_furniture_tipover_title"),
            description: String("danger_furniture_tipover_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at"))
    ]
    

    
    func getLinkForShop(shop: Shop) ->  URL? {
        switch shop {
        case .amazonDE:
            return linkAmazonDE
        case .babywalzAT:
            return linkAmazonDE
        case .babywalzDE:
            return linkAmazonDE
        case .babywalzCH:
            return linkAmazonDE
        case .aliexpress:
            return linkGlobal
        }
    }
    
    func getShareText(shop: Shop) -> String {
        let title = NSLocalizedString(title, comment: "")
        let desc = NSLocalizedString(description, comment: "")
        let link = getLinkForShop(shop: shop)
        let addition = NSLocalizedString("share_brought_to_you_by", comment: "")
        
        var shareText = title + "\n"
        shareText += desc + "\n"
        if link != nil {
            shareText += "\n" + link!.description + "\n"
        }
        shareText += "\n\n" + addition
        return shareText
    }
}

func getNumUnlocked(babyDangers: [BabyDanger]) -> Int {
    var numUnlocked = 0
    babyDangers.forEach { babyDanger in
        if babyDanger.isUnlocked {
            numUnlocked += 1
        }
    }
    return numUnlocked
}

func getNumBanned(babyDangers: [BabyDanger]) -> Int {
    var numBanned = 0
    babyDangers.forEach { babyDanger in
        if babyDanger.isBanned {
            numBanned += 1
        }
    }
    return numBanned
}
