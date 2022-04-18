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
    case world

    var id: Self { self }
    
    var name: String {
        switch self {
        case .at: return NSLocalizedString("austria", comment: "")
        case .de: return NSLocalizedString("germany", comment: "")
        case .ch: return NSLocalizedString("switzerland", comment: "")
        case .world: return NSLocalizedString("world", comment: "")
        }
    }
    
    var shops: [Shop] {
        switch self {
        case .at: return [Shop.amazonDE, Shop.babywalzAT]
        case .de: return [Shop.amazonDE, Shop.babywalzDE]
        case .ch: return [Shop.amazonDE, Shop.babywalzCH]
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
