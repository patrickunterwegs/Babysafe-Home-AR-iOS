//
//  BabyDanger.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 28.03.22.
//

import Foundation

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
    var isDetectedInSession: Bool = false
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
            linkAmazonDE: URL.init(string: "https://www.amazon.at"),
            isUnlocked: true),
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
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "FURNITURE_FALLING",
            objectIds: [217, 316, 317, 364, 379, 492],
            title: String("danger_furniture_fallingof_title"),
            description: String("danger_furniture_fallingof_text"),
            linkGlobal: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "FURNITURE_EDGE",
            objectIds: [217, 364, 379, 492],
            title: String("danger_furniture_edges_title"),
            description: String("danger_furniture_edges_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "FURNITURE_DRAWER",
            objectIds: [217, 364, 379, 492],
            title: String("danger_furniture_drawer_title"),
            description: String("danger_furniture_drawer_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "PLANT_POISON",
            objectIds: [263, 379, 491, 547],
            title: String("danger_plant_poison_title"),
            description: String("danger_plant_poison_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "PLANT_STING",
            objectIds: [263, 379, 491, 547],
            title: String("danger_plant_sting_title"),
            description: String("danger_plant_sting_text"),
            linkGlobal: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "PLANT_SOIL",
            objectIds: [263, 379, 491, 547],
            title: String("danger_plant_soil_title"),
            description: String("danger_plant_soil_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "WASHING_MACHINE",
            objectIds: [40],
            title: String("danger_washingmachine_title"),
            description: String("danger_washingmachine_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "HEATING",
            objectIds: [284],
            title: String("danger_radiator_title"),
            description: String("danger_radiator_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "LIGHTBULB",
            objectIds: [57, 224, 269, 571],
            title: String("danger_lightbulb_title"),
            description: String("danger_lightbulb_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "DOOR_PINCH",
            objectIds: [190, 258],
            title: String("danger_door_pinch_title"),
            description: String("danger_door_pinch_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "DOOR_PINCHBACK",
            objectIds: [190, 258],
            title: String("danger_door_pinchback_title"),
            description: String("danger_door_pinchback_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "DOOR_LOCKOUT",
            objectIds: [190, 258],
            title: String("danger_door_lockout_title"),
            description: String("danger_door_lockout_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "WINDOW",
            objectIds: [242, 519],
            title: String("danger_window_title"),
            description: String("danger_window_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "STAIRS",
            objectIds: [],
            title: String("danger_stairs_title"),
            description: String("danger_stairs_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "HOT_WATER",
            objectIds: [21, 192, 201, 260],
            title: String("danger_hotwater_title"),
            description: String("danger_hotwater_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "BOILER",
            objectIds: [21, 192, 201, 260],
            title: String("danger_boiler_title"),
            description: String("danger_boiler_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "SUPPLIES",
            objectIds: [229, 387, 489, 620],
            title: String("danger_cleaning_supplies_title"),
            description: String("danger_cleaning_supplies_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "SOFA",
            objectIds: [183, 291, 376],
            title: String("danger_sofa_title"),
            description: String("danger_sofa_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "OVEN",
            objectIds: [177, 211, 226, 302, 336, 438, 554],
            title: String("danger_oven_title"),
            description: String("danger_oven_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "OVENSWITCH",
            objectIds: [177, 211, 226, 302, 554],
            title: String("danger_ovenswitch_title"),
            description: String("danger_ovenswitch_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "ROPES",
            objectIds: [103, 104, 118, 196, 242, 289, 519, 573],
            title: String("danger_ropes_title"),
            description: String("danger_ropes_text"),
            linkGlobal: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "CANDLE",
            objectIds: [254, 292, 485],
            title: String("danger_candle_title"),
            description: String("danger_candle_text"),
            linkGlobal: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "HAIR",
            objectIds: [146, 297],
            title: String("danger_hair_title"),
            description: String("danger_hair_text"),
            linkGlobal: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "RAILING",
            objectIds: [],
            title: String("danger_railing_title"),
            description: String("danger_railing_text"),
            linkGlobal: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "DISHWASHER",
            objectIds: [607],
            title: String("danger_dishwasher_title"),
            description: String("danger_dishwasher_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "CABLE",
            objectIds: [61, 479, 573],
            title: String("danger_cable_title"),
            description: String("danger_cable_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "POOL",
            objectIds: [260],
            title: String("danger_pool_title"),
            description: String("danger_pool_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "KNIFE",
            objectIds: [20, 59, 66, 73, 93, 95, 105, 186, 277, 320, 356, 531],
            title: String("danger_knife_title"),
            description: String("danger_knife_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "BAG",
            objectIds: [434, 588, 617],
            title: String("danger_bag_title"),
            description: String("danger_bag_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "TOY",
            objectIds: [22, 331],
            title: String("danger_toy_title"),
            description: String("danger_toy_text"),
            linkGlobal: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "SMALL_ITEMS",
            objectIds: [22, 117, 152, 176, 252, 331],
            title: String("danger_smallitems_title"),
            description: String("danger_smallitems_text"),
            linkGlobal: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "BATTERY",
            objectIds: [70],
            title: String("danger_battery_title"),
            description: String("danger_battery_text"),
            linkGlobal: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "CUTLERY",
            objectIds: [59, 320, 356, 504, 531],
            title: String("danger_cutlery_title"),
            description: String("danger_cutlery_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "COVER",
            objectIds: [239, 249, 277],
            title: String("danger_cover_title"),
            description: String("danger_cover_text"),
            linkGlobal: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "MIRROR",
            objectIds: [348],
            title: String("danger_mirror_title"),
            description: String("danger_mirror_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "FIREPLACE",
            objectIds: [292],
            title: String("danger_fireplace_title"),
            description: String("danger_fireplace_text"),
            linkGlobal: URL.init(string: "https://www.orf.at"),
            linkAmazonDE: URL.init(string: "https://www.amazon.at")),
        BabyDanger(
            id: "WEAPONS",
            objectIds: [85, 386, 394, 398, 435, 470, 487, 565],
            title: String("danger_weapons_title"),
            description: String("danger_weapons_text"),
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
