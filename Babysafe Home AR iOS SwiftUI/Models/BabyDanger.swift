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
}
