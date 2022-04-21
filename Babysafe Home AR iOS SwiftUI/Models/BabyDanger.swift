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
    let linkAliExpress: URL?
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
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_9v3rR1"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3urWwM5")),
        BabyDanger(
            id: "TOILETWATER",
            objectIds: [125, 457, 459],
            title: String("danger_toiletwater_title"),
            description: String("danger_toiletwater_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_A2MrGT"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3xjb2Yu")),
        BabyDanger(
            id: "FURNITURE_TIPOVER",
            objectIds: [217, 364, 379, 492],
            title: String("danger_furniture_tipover_title"),
            description: String("danger_furniture_tipover_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AWRwCr"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3JtFEc0")),
        BabyDanger(
            id: "FURNITURE_FALLING",
            objectIds: [217, 316, 317, 364, 379, 492],
            title: String("danger_furniture_fallingof_title"),
            description: String("danger_furniture_fallingof_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "FURNITURE_EDGE",
            objectIds: [217, 364, 379, 492],
            title: String("danger_furniture_edges_title"),
            description: String("danger_furniture_edges_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_ATl7vH"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3KtcV8T")),
        BabyDanger(
            id: "FURNITURE_DRAWER",
            objectIds: [217, 364, 379, 492],
            title: String("danger_furniture_drawer_title"),
            description: String("danger_furniture_drawer_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_ALZLZH"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3JtBwc0")),
        BabyDanger(
            id: "PLANT_POISON",
            objectIds: [263, 379, 491, 547],
            title: String("danger_plant_poison_title"),
            description: String("danger_plant_poison_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "PLANT_STING",
            objectIds: [263, 379, 491, 547],
            title: String("danger_plant_sting_title"),
            description: String("danger_plant_sting_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "PLANT_SOIL",
            objectIds: [263, 379, 491, 547],
            title: String("danger_plant_soil_title"),
            description: String("danger_plant_soil_text"),
            linkAliExpress: URL.init(string: "https://amzn.to/3jprGxm"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3jprGxm")),
        BabyDanger(
            id: "WASHING_MACHINE",
            objectIds: [40],
            title: String("danger_washingmachine_title"),
            description: String("danger_washingmachine_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_ALZLZH"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3KuEwq6")),
        BabyDanger(
            id: "HEATING",
            objectIds: [284],
            title: String("danger_radiator_title"),
            description: String("danger_radiator_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AtR09Z"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3E0x5EP")),
        BabyDanger(
            id: "LIGHTBULB",
            objectIds: [57, 224, 269, 571],
            title: String("danger_lightbulb_title"),
            description: String("danger_lightbulb_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AYrbWP"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3DWJv0p")),
        BabyDanger(
            id: "DOOR_PINCH",
            objectIds: [190, 258],
            title: String("danger_door_pinch_title"),
            description: String("danger_door_pinch_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AYkDmR"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3O3IBDG")),
        BabyDanger(
            id: "DOOR_PINCHBACK",
            objectIds: [190, 258],
            title: String("danger_door_pinchback_title"),
            description: String("danger_door_pinchback_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AtHMrz"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3LX13Mn")),
        BabyDanger(
            id: "DOOR_LOCKOUT",
            objectIds: [190, 258],
            title: String("danger_door_lockout_title"),
            description: String("danger_door_lockout_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_9xX5WX"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3us0uEt")),
        BabyDanger(
            id: "WINDOW",
            objectIds: [242, 519],
            title: String("danger_window_title"),
            description: String("danger_window_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AX0RiP"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3usE06m")),
        BabyDanger(
            id: "STAIRS",
            objectIds: [],
            title: String("danger_stairs_title"),
            description: String("danger_stairs_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AK66fN"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3uqZbWk")),
        BabyDanger(
            id: "HOT_WATER",
            objectIds: [21, 192, 201, 260],
            title: String("danger_hotwater_title"),
            description: String("danger_hotwater_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_9fyCuX"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3LQdsSo")),
        BabyDanger(
            id: "BOILER",
            objectIds: [21, 192, 201, 260],
            title: String("danger_boiler_title"),
            description: String("danger_boiler_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_Ad2u1D"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3v0uTc0")),
        BabyDanger(
            id: "SUPPLIES",
            objectIds: [229, 387, 489, 620],
            title: String("danger_cleaning_supplies_title"),
            description: String("danger_cleaning_supplies_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AYOmND"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3E00ZJ1")),
        BabyDanger(
            id: "SOFA",
            objectIds: [183, 291, 376],
            title: String("danger_sofa_title"),
            description: String("danger_sofa_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_9RGrp9"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3v0uBSs")),
        BabyDanger(
            id: "OVEN",
            objectIds: [177, 211, 226, 302, 336, 438, 554],
            title: String("danger_oven_title"),
            description: String("danger_oven_text"),
            linkAliExpress: URL.init(string: "https://amzn.to/3JuB39H"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3JuB39H")),
        BabyDanger(
            id: "OVENSWITCH",
            objectIds: [177, 211, 226, 302, 554],
            title: String("danger_ovenswitch_title"),
            description: String("danger_ovenswitch_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AkNyFV"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3DX6FUm")),
        BabyDanger(
            id: "ROPES",
            objectIds: [103, 104, 118, 196, 242, 289, 519, 573],
            title: String("danger_ropes_title"),
            description: String("danger_ropes_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "CANDLE",
            objectIds: [254, 292, 485],
            title: String("danger_candle_title"),
            description: String("danger_candle_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_A7ofYx"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3usDipI")),
        BabyDanger(
            id: "HAIR",
            objectIds: [146, 297],
            title: String("danger_hair_title"),
            description: String("danger_hair_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "RAILING",
            objectIds: [],
            title: String("danger_railing_title"),
            description: String("danger_railing_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "DISHWASHER",
            objectIds: [607],
            title: String("danger_dishwasher_title"),
            description: String("danger_dishwasher_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_ALZLZH"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3DZZnPt")),
        BabyDanger(
            id: "CABLE",
            objectIds: [61, 479, 573],
            title: String("danger_cable_title"),
            description: String("danger_cable_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_9I0Vlz"),
            linkAmazonDE: URL.init(string: "https://amzn.to/35YYNoN")),
        BabyDanger(
            id: "POOL",
            objectIds: [260],
            title: String("danger_pool_title"),
            description: String("danger_pool_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_9ijPoj"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3rbRD7W")),
        BabyDanger(
            id: "KNIFE",
            objectIds: [20, 59, 66, 73, 93, 95, 105, 186, 277, 320, 356, 531],
            title: String("danger_knife_title"),
            description: String("danger_knife_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_98SBAX"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3uqRf7y")),
        BabyDanger(
            id: "BAG",
            objectIds: [434, 588, 617],
            title: String("danger_bag_title"),
            description: String("danger_bag_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "TOY",
            objectIds: [22, 331],
            title: String("danger_toy_title"),
            description: String("danger_toy_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "SMALL_ITEMS",
            objectIds: [22, 117, 152, 176, 252, 331],
            title: String("danger_smallitems_title"),
            description: String("danger_smallitems_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "BATTERY",
            objectIds: [70],
            title: String("danger_battery_title"),
            description: String("danger_battery_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "CUTLERY",
            objectIds: [59, 320, 356, 504, 531],
            title: String("danger_cutlery_title"),
            description: String("danger_cutlery_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_APauDD"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3E70H3m")),
        BabyDanger(
            id: "COVER",
            objectIds: [239, 249, 277],
            title: String("danger_cover_title"),
            description: String("danger_cover_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil),
        BabyDanger(
            id: "MIRROR",
            objectIds: [348],
            title: String("danger_mirror_title"),
            description: String("danger_mirror_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_99ezSJ"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3JzPSrK")),
        BabyDanger(
            id: "FIREPLACE",
            objectIds: [292],
            title: String("danger_fireplace_title"),
            description: String("danger_fireplace_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_ArtoJz"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3v9UNKu")),
        BabyDanger(
            id: "WEAPONS",
            objectIds: [85, 386, 394, 398, 435, 470, 487, 565],
            title: String("danger_weapons_title"),
            description: String("danger_weapons_text"),
            linkAliExpress: URL.init(string: "https://amzn.to/3xfRqEu"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3xfRqEu"))
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
            return linkAliExpress
        }
    }
    
    func getShareText(shop: Shop, babyName: String) -> String {
        let title = NSLocalizedString(title, comment: "")
        let desc = getDescriptionWithBabyname(babyName: babyName)
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
    
    func getDescriptionWithBabyname(babyName: String) -> String {
        var desc = NSLocalizedString(description, comment: "")
        desc = desc.replacingOccurrences(of: "%1$s", with: babyName)
        return desc
    }
}
