//
//  ShopCountry.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 29.03.22.
//

import Foundation

enum ShopCountry: String, CaseIterable, Identifiable {
    case at
    case de
    case ch
    case fr
    case be
    case lu
    case it
    case es
    case pt
    case uk
    case ie
    case nl
    case world

    var id: Self { self }
    
    var name: String {
        if self == .world {
            return NSLocalizedString("dialog_shop_country_world", comment: "")
        }
        else {
            return Locale.current.localizedString(forRegionCode: self.rawValue) ?? self.rawValue
        }
    }
    
    var shops: [Shop] {
        switch self {
        case .at: return [Shop.amazonDE, Shop.babywalzAT]
        case .de: return [Shop.amazonDE, Shop.babywalzDE]
        case .ch: return [Shop.amazonDE, Shop.babywalzCH]
        case .fr: return [Shop.amazonFR]
        case .be: return [Shop.amazonFR, Shop.amazonNL]
        case .lu: return [Shop.amazonFR, Shop.amazonDE]
        case .it: return [Shop.amazonIT]
        case .es: return [Shop.amazonES]
        case .pt: return [Shop.amazonES]
        case .uk: return [Shop.amazonUK]
        case .ie: return [Shop.amazonUK]
        case .nl: return [Shop.amazonNL]
        case .world: return [Shop.aliexpress]

            
        }
    }
}


func getDefaultCountry() -> ShopCountry {
    switch Locale.current.regionCode {
    case "US": return .world
    case "AT": return .at
    case "CH": return .ch
    case "DE": return .de
    case .none: return .world
    case .some(_): return .world
    }
}
