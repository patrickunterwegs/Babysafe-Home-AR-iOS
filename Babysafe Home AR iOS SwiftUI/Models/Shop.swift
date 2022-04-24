//
//  Shop.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 29.03.22.
//

import Foundation

enum Shop: String, CaseIterable, Identifiable {
    case amazonDE
    case amazonFR
    case amazonIT
    case amazonES
    case amazonUK
    case amazonNL
    case amazonCOM
    case amazonCA
    case amazonSE
    case babywalzAT
    case babywalzDE
    case babywalzCH
    case aliexpress

    var id: Self { self }
    
    var name: String {
        switch self {
        case .amazonDE: return "Amazon.de"
        case .amazonFR: return "Amazon.fr"
        case .amazonIT: return "Amazon.it"
        case .amazonES: return "Amazon.es"
        case .amazonUK: return "Amazon.co.uk"
        case .amazonNL: return "Amazon.nl"
        case .amazonCOM: return "Amazon.com"
        case .amazonCA: return "Amazon.ca"
        case .amazonSE: return "Amazon.se"
        case .babywalzAT: return "Baby-Walz.at"
        case .babywalzDE: return "Baby-Walz.de"
        case .babywalzCH: return "Baby-Walz.ch"
        case .aliexpress: return "AliExpress.com"
        }
    }
}

func getDefaultShopForCountry(country: ShopCountry) -> Shop {
    
    switch country {
    case .at: return .amazonDE
    case .de: return .amazonDE
    case .ch: return .amazonDE
    case .fr: return .amazonFR
    case .be: return .amazonFR
    case .lu: return .amazonFR
    case .it: return .amazonIT
    case .es: return .amazonES
    case .pt: return .amazonES
    case .uk: return .amazonUK
    case .ie: return .amazonUK
    case .nl: return .amazonNL
    case .dk: return .amazonDE
    case .is: return .amazonUK
    case .no: return .amazonUK
    case .se: return .amazonSE
    case .fi: return .amazonDE
    case .ee: return .amazonDE
    case .lt: return .amazonDE
    case .lv: return .amazonDE
    case .cz: return .amazonDE
    case .sk: return .aliexpress
    case .hu: return .aliexpress
    case .bg: return .aliexpress
    case .ro: return .aliexpress
    case .gr: return .amazonUK
    case .mt: return .amazonUK
    case .cy: return .amazonUK

        
    case .world: return .aliexpress
    }
}

