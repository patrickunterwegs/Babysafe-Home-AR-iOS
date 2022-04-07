//
//  Shop.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 29.03.22.
//

import Foundation

enum Shop: String, CaseIterable, Identifiable {
    case amazonDE
    case babywalzAT
    case babywalzDE
    case babywalzCH
    case aliexpress

    var id: Self { self }
    
    var name: String {
        switch self {
        case .amazonDE: return "Amazon.de"
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
    case .world: return .aliexpress
    }
}

