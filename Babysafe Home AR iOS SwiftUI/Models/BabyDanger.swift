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
    let linkAmazonFR: URL?
    let linkAmazonIT: URL?
    let linkAmazonES: URL?
    let linkAmazonUK: URL?
    let linkAmazonNL: URL?
    let linkAmazonCOM: URL?
    let linkAmazonCA: URL?
    let linkAmazonSE: URL?
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
            linkAmazonDE: URL.init(string: "https://amzn.to/3urWwM5"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3EslRZY"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3OAMBvE"),
            linkAmazonES: URL.init(string: "https://amzn.to/38j5N0D"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3vyt0DG"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3rMmUhW"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3MtijcE"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3K9zXAC"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3LeTjFE")
        ),
        BabyDanger(
            id: "TOILETWATER",
            objectIds: [125, 457, 459],
            title: String("danger_toiletwater_title"),
            description: String("danger_toiletwater_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_A2MrGT"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3xjb2Yu"),
            linkAmazonFR: URL.init(string: "https://amzn.to/36mt6ps"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3vFW8Jp"),
            linkAmazonES: URL.init(string: "https://amzn.to/3OrQxyS"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3EGejCX"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3v7YJNd"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/390j3HC"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3ECMStJ"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3kcToxC")
        ),
        BabyDanger(
            id: "FURNITURE_TIPOVER",
            objectIds: [217, 364, 379, 492],
            title: String("danger_furniture_tipover_title"),
            description: String("danger_furniture_tipover_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AWRwCr"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3JtFEc0"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3jO9nCh"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3k8OsKs"),
            linkAmazonES: URL.init(string: "https://amzn.to/37yVpBX"),
            linkAmazonUK: URL.init(string: "https://amzn.to/38mlSCJ"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3vJCpbX"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3vxN898"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3ECMStJ"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3k95xE4")
        ),
        BabyDanger(
            id: "FURNITURE_FALLING",
            objectIds: [217, 316, 317, 364, 379, 492],
            title: String("danger_furniture_fallingof_title"),
            description: String("danger_furniture_fallingof_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil,
            linkAmazonFR: nil,
            linkAmazonIT: nil,
            linkAmazonES: nil,
            linkAmazonUK: nil,
            linkAmazonNL: nil,
            linkAmazonCOM: nil,
            linkAmazonCA: nil,
            linkAmazonSE: nil
        ),
        BabyDanger(
            id: "FURNITURE_EDGE",
            objectIds: [217, 364, 379, 492],
            title: String("danger_furniture_edges_title"),
            description: String("danger_furniture_edges_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_ATl7vH"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3KtcV8T"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3Md7BH3"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3EGiRsV"),
            linkAmazonES: URL.init(string: "https://amzn.to/3k5Mjzd"),
            linkAmazonUK: URL.init(string: "https://amzn.to/37BKDLc"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3ELbpgk"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/38iBwit"),
            linkAmazonCA: URL.init(string: "https://amzn.to/38iUJ3z"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3vHbihn")
        ),
        BabyDanger(
            id: "FURNITURE_DRAWER",
            objectIds: [217, 364, 379, 492],
            title: String("danger_furniture_drawer_title"),
            description: String("danger_furniture_drawer_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_ALZLZH"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3JtBwc0"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3rA31KX"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3OscFJD"),
            linkAmazonES: URL.init(string: "https://amzn.to/3Kde57n"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3xQakT0"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3OJVNhE"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/394M4C1"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3OvPApl"),
            linkAmazonSE: URL.init(string: "https://amzn.to/38lLAHu")
        ),
        BabyDanger(
            id: "PLANT_POISON",
            objectIds: [263, 379, 491, 547],
            title: String("danger_plant_poison_title"),
            description: String("danger_plant_poison_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil,
            linkAmazonFR: nil,
            linkAmazonIT: nil,
            linkAmazonES: nil,
            linkAmazonUK: nil,
            linkAmazonNL: nil,
            linkAmazonCOM: nil,
            linkAmazonCA: nil,
            linkAmazonSE: nil
        ),
        BabyDanger(
            id: "PLANT_STING",
            objectIds: [263, 379, 491, 547],
            title: String("danger_plant_sting_title"),
            description: String("danger_plant_sting_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil,
            linkAmazonFR: nil,
            linkAmazonIT: nil,
            linkAmazonES: nil,
            linkAmazonUK: nil,
            linkAmazonNL: nil,
            linkAmazonCOM: nil,
            linkAmazonCA: nil,
            linkAmazonSE: nil
        ),
        BabyDanger(
            id: "PLANT_SOIL",
            objectIds: [263, 379, 491, 547],
            title: String("danger_plant_soil_title"),
            description: String("danger_plant_soil_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_9RygBZ"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3jprGxm"),
            linkAmazonFR: URL.init(string: "https://amzn.to/36I4R5j"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3vcIy1f"),
            linkAmazonES: URL.init(string: "https://amzn.to/3rOxoxj"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3Kazo9M"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3OsfeeJ"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3K8H5xd"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3v8Jnbp"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3OufWbr")
        ),
        BabyDanger(
            id: "WASHING_MACHINE",
            objectIds: [40],
            title: String("danger_washingmachine_title"),
            description: String("danger_washingmachine_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_ALZLZH"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3KuEwq6"),
            linkAmazonFR: URL.init(string: "https://amzn.to/37kEP8J"),
            linkAmazonIT: URL.init(string: "https://amzn.to/38inBIY"),
            linkAmazonES: URL.init(string: "https://amzn.to/3xLYEk0"),
            linkAmazonUK: URL.init(string: "https://amzn.to/38iVrxr"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3OrQnrg"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/36CK1En"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3K87NWs"),
            linkAmazonSE: URL.init(string: "https://amzn.to/38lLAHu")
        ),
        BabyDanger(
            id: "HEATING",
            objectIds: [284],
            title: String("danger_radiator_title"),
            description: String("danger_radiator_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AtR09Z"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3E0x5EP"),
            linkAmazonFR: URL.init(string: "https://amzn.to/37kFjM5"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3rMSkVM"),
            linkAmazonES: URL.init(string: "https://amzn.to/38i6yqy"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3xTPj9N"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3EHt20a"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3MleSVi"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3s8g1Ij"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3k88dlb")
        ),
        BabyDanger(
            id: "LIGHTBULB",
            objectIds: [57, 224, 269, 571],
            title: String("danger_lightbulb_title"),
            description: String("danger_lightbulb_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AYrbWP"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3DWJv0p"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3JRtYA8"),
            linkAmazonIT: URL.init(string: "https://amzn.to/38fg91o"),
            linkAmazonES: URL.init(string: "https://amzn.to/3rK73Ar"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3rNnjRz"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3k8KLEu"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3Oyind1"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3OwfZU8"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3kbjvFr")
        ),
        BabyDanger(
            id: "DOOR_PINCH",
            objectIds: [190, 258],
            title: String("danger_door_pinch_title"),
            description: String("danger_door_pinch_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AYkDmR"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3O3IBDG"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3EvMOvF"),
            linkAmazonIT: URL.init(string: "https://amzn.to/37ARfth"),
            linkAmazonES: URL.init(string: "https://amzn.to/3MwkgFf"),
            linkAmazonUK: URL.init(string: "https://amzn.to/37JOEwV"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3rN8tKu"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3MmBrsH"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3v3ObyC"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3vEUGai")
        ),
        BabyDanger(
            id: "DOOR_PINCHBACK",
            objectIds: [190, 258],
            title: String("danger_door_pinchback_title"),
            description: String("danger_door_pinchback_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AtHMrz"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3LX13Mn"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3EmCZjJ"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3Kdb3Qx"),
            linkAmazonES: URL.init(string: "https://amzn.to/3k7UFGl"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3rQ3JnI"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3rPMtPj"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3K7PJf6"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3MoAK1X"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3vazKZB")
        ),
        BabyDanger(
            id: "DOOR_LOCKOUT",
            objectIds: [190, 258],
            title: String("danger_door_lockout_title"),
            description: String("danger_door_lockout_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_9xX5WX"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3us0uEt"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3rAtg3X"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3KcoDUr"),
            linkAmazonES: URL.init(string: "https://amzn.to/3rJ9t2v"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3Mo0pIc"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3Ms01Zf"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3rMml7R"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3vBOwHJ"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3Oy14Zq")
        ),
        BabyDanger(
            id: "WINDOW",
            objectIds: [242, 519],
            title: String("danger_window_title"),
            description: String("danger_window_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AX0RiP"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3usE06m"),
            linkAmazonFR: URL.init(string: "https://amzn.to/36qHb5s"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3vka0dz"),
            linkAmazonES: URL.init(string: "https://amzn.to/3Oxk6iG"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3OyNW6w"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3Oz0nz1"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3K1Ffhq"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3K81lPr"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3LbhIMr")
        ),
        BabyDanger(
            id: "STAIRS",
            objectIds: [],
            title: String("danger_stairs_title"),
            description: String("danger_stairs_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AK66fN"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3uqZbWk"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3Oi1wuF"),
            linkAmazonIT: URL.init(string: "https://amzn.to/38i5uTs"),
            linkAmazonES: URL.init(string: "https://amzn.to/3k9UA5c"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3EFIt9m"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3EKMcCl"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3K7JHvb"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3rM2OEx"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3k5ukZw")
        ),
        BabyDanger(
            id: "HOT_WATER",
            objectIds: [21, 192, 201, 260],
            title: String("danger_hotwater_title"),
            description: String("danger_hotwater_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_9fyCuX"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3LQdsSo"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3vqdytx"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3k8PtCg"),
            linkAmazonES: URL.init(string: "https://amzn.to/3rJSFs4"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3Mq8FqZ"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3OyNLYU"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3K6Ty4u"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3v5h7q0"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3k5LtCv")
        ),
        BabyDanger(
            id: "BOILER",
            objectIds: [21, 192, 201, 260],
            title: String("danger_boiler_title"),
            description: String("danger_boiler_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_Ad2u1D"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3v0uTc0"),
            linkAmazonFR: URL.init(string: "https://amzn.to/36ocwpp"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3K5XFxr"),
            linkAmazonES: URL.init(string: "https://amzn.to/3rNmW9D"),
            linkAmazonUK: URL.init(string: "https://amzn.to/37BJOSC"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3rMm052"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3OvjlGG"),
            linkAmazonCA: URL.init(string: "https://amzn.to/37wrASx"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3KfcCgK")
        ),
        BabyDanger(
            id: "SUPPLIES",
            objectIds: [229, 387, 489, 620],
            title: String("danger_cleaning_supplies_title"),
            description: String("danger_cleaning_supplies_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AYOmND"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3E00ZJ1"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3OijOfs"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3v79oYu"),
            linkAmazonES: URL.init(string: "https://amzn.to/3OKVaV9"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3MmuaJe"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3vcL3k9"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3EFu0KH"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3K9ogKf"),
            linkAmazonSE: URL.init(string: "https://amzn.to/36LbHHm")
        ),
        BabyDanger(
            id: "SOFA",
            objectIds: [183, 291, 376],
            title: String("danger_sofa_title"),
            description: String("danger_sofa_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_9RGrp9"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3v0uBSs"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3voaRZn"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3EId3PE"),
            linkAmazonES: URL.init(string: "https://amzn.to/3OxjJEO"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3vFYeZN"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3OxXyy6"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3vBCzSn"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3L35YLT"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3K5tK8R")
        ),
        BabyDanger(
            id: "OVEN",
            objectIds: [177, 211, 226, 302, 336, 438, 554],
            title: String("danger_oven_title"),
            description: String("danger_oven_text"),
            linkAliExpress: URL.init(string: "https://amzn.to/3JuB39H"),            // No AliExpress Product!
            linkAmazonDE: URL.init(string: "https://amzn.to/3JuB39H"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3JSAsib"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3kpHFfD"),
            linkAmazonES: URL.init(string: "https://amzn.to/3Kb346y"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3Mr600h"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3vAxB8y"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3K8NV5u"),
            linkAmazonCA: URL.init(string: "https://amzn.to/37BwbTa"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3k5JVsb")
        ),
        BabyDanger(
            id: "OVENSWITCH",
            objectIds: [177, 211, 226, 302, 554],
            title: String("danger_ovenswitch_title"),
            description: String("danger_ovenswitch_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AkNyFV"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3DX6FUm"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3uRDYoY"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3k93Sy5"),
            linkAmazonES: URL.init(string: "https://amzn.to/3EJ7UHd"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3k5YFXN"),
            linkAmazonNL: URL.init(string: "https://amzn.to/36KgBo2"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3K1FR6R"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3EFtI6f"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3K5lEgo")
        ),
        BabyDanger(
            id: "ROPES",
            objectIds: [103, 104, 118, 196, 242, 289, 519, 573],
            title: String("danger_ropes_title"),
            description: String("danger_ropes_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil,
            linkAmazonFR: nil,
            linkAmazonIT: nil,
            linkAmazonES: nil,
            linkAmazonUK: nil,
            linkAmazonNL: nil,
            linkAmazonCOM: nil,
            linkAmazonCA: nil,
            linkAmazonSE: nil
        ),
        BabyDanger(
            id: "CANDLE",
            objectIds: [254, 292, 485],
            title: String("danger_candle_title"),
            description: String("danger_candle_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_A7ofYx"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3usDipI"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3jMhlvw"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3OCNOmy"),
            linkAmazonES: URL.init(string: "https://amzn.to/3saIQ6X"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3K5izgg"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3K59GmY"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/394BjQ5"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3K9CGdk"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3KiUhQc")
        ),
        BabyDanger(
            id: "HAIR",
            objectIds: [146, 297],
            title: String("danger_hair_title"),
            description: String("danger_hair_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil,
            linkAmazonFR: nil,
            linkAmazonIT: nil,
            linkAmazonES: nil,
            linkAmazonUK: nil,
            linkAmazonNL: nil,
            linkAmazonCOM: nil,
            linkAmazonCA: nil,
            linkAmazonSE: nil
        ),
        BabyDanger(
            id: "RAILING",
            objectIds: [],
            title: String("danger_railing_title"),
            description: String("danger_railing_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_A6AlC9"),
            linkAmazonDE: URL.init(string: "https://amzn.to/39xHz3d"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3s7L5b3"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3vUr20U"),
            linkAmazonES: URL.init(string: "https://amzn.to/3OOHqZf"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3LBbTbr"),
            linkAmazonNL: URL.init(string: "https://amzn.to/38GN3YW"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3LDPPN5"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3vQbzPi"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3MHbPqD")            
        ),
        BabyDanger(
            id: "DISHWASHER",
            objectIds: [607],
            title: String("danger_dishwasher_title"),
            description: String("danger_dishwasher_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_ALZLZH"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3DZZnPt"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3EqJYI8"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3vbe5k1"),
            linkAmazonES: URL.init(string: "https://amzn.to/3kcEJT6"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3kpIS6F"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3Mq8gEZ"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/394M4C1"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3OvPApl"),
            linkAmazonSE: URL.init(string: "https://amzn.to/38lLAHu")
        ),
        BabyDanger(
            id: "CABLE",
            objectIds: [61, 479, 573],
            title: String("danger_cable_title"),
            description: String("danger_cable_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_9I0Vlz"),
            linkAmazonDE: URL.init(string: "https://amzn.to/35YYNoN"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3ryyzBb"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3Lc8AqJ"),
            linkAmazonES: URL.init(string: "https://amzn.to/3xNYgkY"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3v7WXM3"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3OxXqyC"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/36CKZk2"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3vWP3V9"),
            linkAmazonSE: URL.init(string: "https://amzn.to/38g73kX")
        ),
        BabyDanger(
            id: "POOL",
            objectIds: [260],
            title: String("danger_pool_title"),
            description: String("danger_pool_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_9ijPoj"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3rbRD7W"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3uQF2cq"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3KcsmB2"),
            linkAmazonES: URL.init(string: "https://amzn.to/3v9SxnK"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3Le6ff6"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3v9bZRA"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3v4igOz"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3MqbOap"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3LbP8us")
        ),
        BabyDanger(
            id: "KNIFE",
            objectIds: [20, 59, 66, 73, 93, 95, 105, 186, 277, 320, 356, 531],
            title: String("danger_knife_title"),
            description: String("danger_knife_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_98SBAX"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3uqRf7y"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3Eq6D7z"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3Mr4Ce5"),
            linkAmazonES: URL.init(string: "https://amzn.to/3v8FLWM"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3vCruRi"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3Mxisff"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/37z3w1k"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3v9GOpy"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3Lff1tb")
        ),
        BabyDanger(
            id: "BAG",
            objectIds: [434, 588, 617],
            title: String("danger_bag_title"),
            description: String("danger_bag_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil,
            linkAmazonFR: nil,
            linkAmazonIT: nil,
            linkAmazonES: nil,
            linkAmazonUK: nil,
            linkAmazonNL: nil,
            linkAmazonCOM: nil,
            linkAmazonCA: nil,
            linkAmazonSE: nil
        ),
        BabyDanger(
            id: "TOY",
            objectIds: [22, 331],
            title: String("danger_toy_title"),
            description: String("danger_toy_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil,             linkAmazonFR: nil,
            linkAmazonIT: nil,
            linkAmazonES: nil,
            linkAmazonUK: nil,
            linkAmazonNL: nil,
            linkAmazonCOM: nil,
            linkAmazonCA: nil,
            linkAmazonSE: nil
        ),
        BabyDanger(
            id: "SMALL_ITEMS",
            objectIds: [22, 117, 152, 176, 252, 331],
            title: String("danger_smallitems_title"),
            description: String("danger_smallitems_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil,             linkAmazonFR: nil,
            linkAmazonIT: nil,
            linkAmazonES: nil,
            linkAmazonUK: nil,
            linkAmazonNL: nil,
            linkAmazonCOM: nil,
            linkAmazonCA: nil,
            linkAmazonSE: nil
        ),
        BabyDanger(
            id: "BATTERY",
            objectIds: [70],
            title: String("danger_battery_title"),
            description: String("danger_battery_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil,
            linkAmazonFR: nil,
            linkAmazonIT: nil,
            linkAmazonES: nil,
            linkAmazonUK: nil,
            linkAmazonNL: nil,
            linkAmazonCOM: nil,
            linkAmazonCA: nil,
            linkAmazonSE: nil
        ),
        BabyDanger(
            id: "CUTLERY",
            objectIds: [59, 320, 356, 504, 531],
            title: String("danger_cutlery_title"),
            description: String("danger_cutlery_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_APauDD"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3E70H3m"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3xvcGq6"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3k5eX3i"),
            linkAmazonES: URL.init(string: "https://amzn.to/3k3Ct0J"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3MobBo8"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3rOfiM6"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3xNjRKb"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3k5LIgF"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3EJ5jg7")
        ),
        BabyDanger(
            id: "COVER",
            objectIds: [239, 249, 277],
            title: String("danger_cover_title"),
            description: String("danger_cover_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil,
            linkAmazonFR: nil,
            linkAmazonIT: nil,
            linkAmazonES: nil,
            linkAmazonUK: nil,
            linkAmazonNL: nil,
            linkAmazonCOM: nil,
            linkAmazonCA: nil,
            linkAmazonSE: nil
        ),
        BabyDanger(
            id: "MIRROR",
            objectIds: [348],
            title: String("danger_mirror_title"),
            description: String("danger_mirror_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_99ezSJ"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3JzPSrK"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3vpvC6P"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3EJ6HQb"),
            linkAmazonES: URL.init(string: "https://amzn.to/3k5xRXV"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3Kd0PQe"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3vaxqBN"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3K7Mm89"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3Ms0R86"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3rJgQHd")
        ),
        BabyDanger(
            id: "FIREPLACE",
            objectIds: [292],
            title: String("danger_fireplace_title"),
            description: String("danger_fireplace_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_ArtoJz"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3v9UNKu"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3Me0XAa"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3xPRviI"),
            linkAmazonES: URL.init(string: "https://amzn.to/3Kdc4rP"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3OrOHhs"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3K5gcu1"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/37ycwUr"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3EG87uD"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3v9rngL")
        ),
        BabyDanger(
            id: "WEAPONS",
            objectIds: [85, 386, 394, 398, 435, 470, 487, 565],
            title: String("danger_weapons_title"),
            description: String("danger_weapons_text"),
            linkAliExpress: URL.init(string: "https://amzn.to/3xfRqEu"),                // no AliExpress Product!!!
            linkAmazonDE: URL.init(string: "https://amzn.to/3xfRqEu"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3Elnicx"),
            linkAmazonIT: URL.init(string: "https://amzn.to/3LccEYh"),
            linkAmazonES: URL.init(string: "https://amzn.to/3OAXXA7"),
            linkAmazonUK: URL.init(string: "https://amzn.to/3Lc9bIZ"),
            linkAmazonNL: URL.init(string: "https://amzn.to/3vcGG8K"),
            linkAmazonCOM: URL.init(string: "https://amzn.to/3OvwTCd"),
            linkAmazonCA: URL.init(string: "https://amzn.to/3ECZQaN"),
            linkAmazonSE: URL.init(string: "https://amzn.to/3vclcc7")
        )
    ]
    
    
    
    func getLinkForShop(shop: Shop) ->  URL? {
        switch shop {
        case .amazonDE:
            return linkAmazonDE
        case.amazonFR:
            return linkAmazonFR
        case .amazonIT:
            return linkAmazonIT
        case .amazonES:
            return linkAmazonES
        case .amazonUK:
            return linkAmazonUK
        case .amazonNL:
            return linkAmazonUK
        case .amazonCOM:
            return linkAmazonCOM
        case .amazonCA:
            return linkAmazonSE
        case .amazonSE:
            return linkAmazonSE
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
