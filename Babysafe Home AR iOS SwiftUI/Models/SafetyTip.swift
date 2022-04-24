//
//  SafetyTip.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 05.04.22.
//

import Foundation



struct SafetyTip: Identifiable {
    let id: String
    let title: String
    let description: String
    let image: String
    let linkAliExpress: [SafetyTipLink]
    let linkAmazonDE: [SafetyTipLink]
    let linkAmazonFR: [SafetyTipLink]
    let linkAmazonIT: [SafetyTipLink]
    let linkAmazonES: [SafetyTipLink]
    let linkAmazonUK: [SafetyTipLink]
    let linkAmazonNL: [SafetyTipLink]
    let linkAmazonCOM: [SafetyTipLink]
    let linkAmazonCA: [SafetyTipLink]
    let linkAmazonSE: [SafetyTipLink]
    var isUnlocked: Bool = false
    var isUnread: Bool = false
}

extension SafetyTip {
    static let allSafetyTips: [SafetyTip] =
    [
        SafetyTip(
            id: "ELECTRICITY",
            title: String("tip_electricity_title"),
            description: String("tip_electricity_text"),
            image: "img_powerplug",
            linkAliExpress: [SafetyTipLink(text: "tip_electricity_link_plug_eu", link: URL.init(string: "https://www.amazon.at")!)],
            linkAmazonDE:
                [SafetyTipLink(text: "tip_electricity_link_plug_eu", link: URL.init(string: "https://www.amazon.de/dp/B00PHHMW02/?tag=glv-21&ascsubtag=a349919b-5a0c-48d6-8361-e2c4486bd521&th=1&psc=1&linkCode=osi")!),
                 SafetyTipLink(text: "tip_electricity_link_screw_eu", link: URL.init(string: "https://www.baby-walz.at/p/reer-20er-pack-steckdosenschutz-schraubbar-p1535876/?variantId=P1535876_177735928&amp;ff_campaign=&amp;ff_origPageSize=60&amp;ff_pos=2&amp;ff_page=1&amp;ff_query=Wohnen%2fSicherheit%2fKindersicherung&amp;ff_mid=536244")!)
                ],
            linkAmazonFR: [],
            linkAmazonIT: [],
            linkAmazonES: [],
            linkAmazonUK: [],
            linkAmazonNL: [],
            linkAmazonCOM: [],
            linkAmazonCA: [],
            linkAmazonSE: []
        ),
        SafetyTip(
            id: "TILL_HERE",
            title: String("tip_till_here_not_further_title"),
            description: String("tip_till_here_not_further_text"),
            image: "img_fence",
            linkAliExpress: [],
            linkAmazonDE: [],
            linkAmazonFR: [],
            linkAmazonIT: [],
            linkAmazonES: [],
            linkAmazonUK: [],
            linkAmazonNL: [],
            linkAmazonCOM: [],
            linkAmazonCA: [],
            linkAmazonSE: []
        ),
        SafetyTip(
            id: "BABY_PRISON",
            title: String("tip_baby_prison_title"),
            description: String("tip_baby_prison_text"),
            image: "img_grid",
            linkAliExpress: [],
            linkAmazonDE: [],
            linkAmazonFR: [],
            linkAmazonIT: [],
            linkAmazonES: [],
            linkAmazonUK: [],
            linkAmazonNL: [],
            linkAmazonCOM: [],
            linkAmazonCA: [],
            linkAmazonSE: []
        ),
        SafetyTip(
            id: "BETA_END",
            title: String("This is the end ..."),
            description: String("... of the entries in this beta-version, more to come :-)"),
            image: "img_grid",
            linkAliExpress: [],
            linkAmazonDE: [],
            linkAmazonFR: [],
            linkAmazonIT: [],
            linkAmazonES: [],
            linkAmazonUK: [],
            linkAmazonNL: [],
            linkAmazonCOM: [],
            linkAmazonCA: [],
            linkAmazonSE: []
        )
    ]
    
    
    func getSafetyTipLinksForShop(shop: Shop) ->  [SafetyTipLink] {
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
            return linkAliExpress
        case .amazonFR:
            return linkAmazonFR
        case .amazonIT:
            return linkAmazonIT
        case .amazonES:
            return linkAmazonES
        case .amazonUK:
            return linkAmazonUK
        case .amazonNL:
            return linkAmazonNL
        case .amazonCOM:
            return linkAmazonCOM
        case .amazonCA:
            return linkAmazonCA
        case .amazonSE:
            return linkAmazonSE
        }
    }
    
    func getShareText(shop: Shop, babyName: String) -> String {
        let title = NSLocalizedString(title, comment: "")
        let desc = getDescriptionWithBabyname(babyName: babyName)
        let links = getSafetyTipLinksForShop(shop: shop)
        let addition = NSLocalizedString("share_brought_to_you_by", comment: "")
        
        var shareText = title + "\n"
        shareText += desc + "\n"
        
        links.forEach { link in
            shareText += "\n" + NSLocalizedString(link.text, comment: "") + ":\n" + link.link.absoluteString + "\n"
        }
        
        shareText += "\n\n" + addition
        return shareText
    }
    
    func getDescriptionWithBabyname(babyName: String) -> String {
        var desc = NSLocalizedString(description, comment: "")
        desc = desc.replacingOccurrences(of: "%1$s", with: babyName)
        return desc
    }
}


struct SafetyTipLink: Identifiable {
    
    let text: String
    let link: URL
    
    var id: UUID = UUID()
}
