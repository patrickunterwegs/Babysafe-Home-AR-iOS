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
        case .at: return "Austria"
        case .de: return "Germany"
        case .ch: return "Switzerland"
        case .world: return "World"
        }
    }
    
    var shops: [Shop] {
        switch self {
        case .at: return [Shop.amazonDE, Shop.babywalzAT, Shop.aliexpress]
        case .de: return [Shop.amazonDE, Shop.babywalzDE, Shop.aliexpress]
        case .ch: return [Shop.amazonDE, Shop.babywalzCH, Shop.aliexpress]
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
