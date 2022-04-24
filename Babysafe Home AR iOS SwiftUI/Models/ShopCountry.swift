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
    case dk
    case `is`
    case no
    case se
    case fi
    case ee
    case lt
    case lv
    case cz
    case sk
    case hu
    case bg
    case ro
    case gr
    case mt
    case cy
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
        case .at: return [Shop.amazonDE]
        case .de: return [Shop.amazonDE]
        case .ch: return [Shop.amazonDE, Shop.amazonFR, Shop.amazonIT]
        case .fr: return [Shop.amazonFR]
        case .be: return [Shop.amazonFR, Shop.amazonNL]
        case .lu: return [Shop.amazonFR, Shop.amazonDE]
        case .it: return [Shop.amazonIT]
        case .es: return [Shop.amazonES]
        case .pt: return [Shop.amazonES]
        case .uk: return [Shop.amazonUK]
        case .ie: return [Shop.amazonUK]
        case .nl: return [Shop.amazonNL]
        case .dk: return [Shop.amazonDE]
        case .is: return [Shop.amazonUK]
        case .no: return [Shop.amazonUK]
        case .se: return [Shop.amazonSE]
        case .fi: return [Shop.aliexpress, Shop.amazonDE]
        case .ee: return [Shop.aliexpress, Shop.amazonDE]
        case .lt: return [Shop.aliexpress, Shop.amazonDE]
        case .lv: return [Shop.aliexpress, Shop.amazonDE]
        case .cz: return [Shop.aliexpress, Shop.amazonDE]
        case .sk: return [Shop.aliexpress, Shop.amazonDE]
        case .hu: return [Shop.aliexpress, Shop.amazonDE]
        case .bg: return [Shop.aliexpress, Shop.amazonDE]
        case .ro: return [Shop.aliexpress, Shop.amazonDE]
        case .gr: return [Shop.aliexpress, Shop.amazonUK, Shop.amazonDE]
        case .mt: return [Shop.aliexpress, Shop.amazonUK, Shop.amazonDE]
        case .cy: return [Shop.aliexpress, Shop.amazonUK, Shop.amazonDE]
        case .world: return [Shop.aliexpress, Shop.amazonDE]
        }
    }
}


func getDefaultCountry() -> ShopCountry {
    switch Locale.current.regionCode {
    case "US": return .world
    case "AT": return .at
    case "CH": return .ch
    case "DE": return .de
    case "FR": return .fr
    case "BE": return .be
    case "LU": return .lu
    case "IT": return .it
    case "ES": return .es
    case "PT": return .pt
    case "UK": return .uk
    case "IE": return .ie
    case "NL": return .nl
    case "DK": return .dk
    case "IS": return .is
    case "NO": return .no
    case "SE": return .se
    case "FI": return .fi
    case "EE": return .ee
    case "LT": return .lt
    case "LV": return .lv
    case "CZ": return .cz
    case "SK": return .sk
    case "HU": return .hu
    case "BG": return .bg
    case "RO": return .ro
    case "GR": return .gr
    case "MT": return .mt
    case "CY": return .cy
    case .none: return .world
    case .some(_): return .world
    }
}
