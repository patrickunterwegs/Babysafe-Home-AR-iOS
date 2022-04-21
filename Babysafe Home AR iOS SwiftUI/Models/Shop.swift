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
    case .ch: return .babywalzCH
    case .fr: return .amazonFR
    case .be: return .amazonFR
    case .lu: return .amazonFR
    case .it: return .amazonIT
    case .es: return .amazonES
    case .pt: return .amazonES
    case .uk: return .amazonUK
    case .ie: return .amazonUK
    case .nl: return .amazonNL
    case .world: return .aliexpress
    }
}

