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
                linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B08SCGL6YD?psc=1&pd_rd_i=B08SCGL6YD&pd_rd_w=4Z3yV&pf_rd_p=28496f9a-8e03-4dec-b031-58b016891aa6&pd_rd_wg=wvTE8&pf_rd_r=X0CFB1HZSGDXPNRT0HSP&pd_rd_r=6115f779-2697-42f3-862a-72882531cdbe&s=baby&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUFETDIzOUk5MEZYNjgmZW5jcnlwdGVkSWQ9QTA5MTQ0MzMyMFUzQUExSjIwTEIxJmVuY3J5cHRlZEFkSWQ9QTEwNDc1NDc0Vk5QUzc0VjJONjImd2lkZ2V0TmFtZT1zcF9kZXRhaWwmYWN0aW9uPWNsaWNrUmVkaXJlY3QmZG9Ob3RMb2dDbGljaz10cnVl&linkCode=ll1&tag=techbee067-21&linkId=5fef1c4f4cec52522035eeaac0758a8d&language=it_IT&ref_=as_li_ss_tl"),
                linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B0816ZBB9P?&linkCode=ll1&tag=techbee093-21&linkId=8c7ca90dfc416da1a779095d19b3e8ce&language=es_ES&ref_=as_li_ss_tl"),
                linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B094HP1Z5D?&linkCode=ll1&tag=techbee061-21&linkId=c86d5d8c7fa04fccb7241b6fcd445894&language=en_GB&ref_=as_li_ss_tl"),
                linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B08DTLFFSG?th=1&linkCode=ll1&tag=techbee0f-21&linkId=d7e8763051c7dcf2ddaf9e1a73fa6aab&language=en_GB&ref_=as_li_ss_tl")),
                
        BabyDanger(
            id: "TOILETWATER",
            objectIds: [125, 457, 459],
            title: String("danger_toiletwater_title"),
            description: String("danger_toiletwater_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_A2MrGT"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3xjb2Yu"),
            linkAmazonFR: URL.init(string: "https://amzn.to/36mt6ps"),
                    linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B095BSM1ZB?&linkCode=ll1&tag=techbee067-21&linkId=60f740d26a55bafdcf11540be7810830&language=it_IT&ref_=as_li_ss_tl"),
                    linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B0995TCJ11?&linkCode=ll1&tag=techbee093-21&linkId=66fa39c1a71c5867911df84faec6b32d&language=pt_PT&ref_=as_li_ss_tl"),
                    linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B08FHWGP4P?&linkCode=ll1&tag=techbee061-21&linkId=730671e8dfe82001cb746bbf10834c0e&language=en_GB&ref_=as_li_ss_tl"),
                    linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B07SYJBZKC?&linkCode=ll1&tag=techbee0f-21&linkId=171d03a7f8568e6727ac3485be3a5c7e&language=en_GB&ref_=as_li_ss_tl")
                    
        ),
        BabyDanger(
            id: "FURNITURE_TIPOVER",
            objectIds: [217, 364, 379, 492],
            title: String("danger_furniture_tipover_title"),
            description: String("danger_furniture_tipover_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AWRwCr"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3JtFEc0"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3jO9nCh"),
                  linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B07VX9GZ9Q?&linkCode=ll1&tag=techbee067-21&linkId=4b929ddf2a4c891d3ad5c74666af6ca9&language=it_IT&ref_=as_li_ss_tl"),
                  linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B07VX9GZ9Q?&linkCode=ll1&tag=techbee093-21&linkId=60be88ec896cdb1304705e7e17b3eb75&language=es_ES&ref_=as_li_ss_tl"),
                  linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B06VVMGQ5P?&linkCode=ll1&tag=techbee061-21&linkId=823d1bac9ab01a2aea4ff5c0ebc34ffa&language=en_GB&ref_=as_li_ss_tl"),
                  linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B084X6TPYK?th=1&linkCode=ll1&tag=techbee0f-21&linkId=1821f663c755f5359d27eff6ee1577e9&language=en_GB&ref_=as_li_ss_tl")
                  
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
        linkAmazonNL: nil
        ),
        BabyDanger(
            id: "FURNITURE_EDGE",
            objectIds: [217, 364, 379, 492],
            title: String("danger_furniture_edges_title"),
            description: String("danger_furniture_edges_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_ATl7vH"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3KtcV8T"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3Md7BH3"),
                linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B09MF3MQZX?&linkCode=ll1&tag=techbee067-21&linkId=2a67b2dac267c0547410dfabbe809e2e&ref_=as_li_ss_tl"),
                linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B08YNGKLYL?&linkCode=ll1&tag=techbee093-21&linkId=a62262e34e6c466394eca31cf5087198&language=pt_PT&ref_=as_li_ss_tl"),
                linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B0771L5HN5?th=1&linkCode=ll1&tag=techbee061-21&linkId=a7a27c0b73a5ec61e079ac2ba2996087&language=en_GB&ref_=as_li_ss_tl"),
                linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B083DDQ6RR?&linkCode=ll1&tag=techbee0f-21&linkId=5f21a9e96a6a5f53f34e1bd389dd49f4&language=en_GB&ref_=as_li_ss_tl")
        ),
        BabyDanger(
            id: "FURNITURE_DRAWER",
            objectIds: [217, 364, 379, 492],
            title: String("danger_furniture_drawer_title"),
            description: String("danger_furniture_drawer_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_ALZLZH"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3JtBwc0"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3rA31KX"),
                 linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B083928NGZ?&linkCode=ll1&tag=techbee067-21&linkId=89f835292455b5b84fb8002fbe816650&ref_=as_li_ss_tl"),
                 linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B07QQK1Y8Z?&linkCode=ll1&tag=techbee093-21&linkId=c759b521e70e304ed70031c1fa22e38d&language=es_ES&ref_=as_li_ss_tl"),
                 linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B072KPZMMV?&linkCode=ll1&tag=techbee061-21&linkId=a59cbbfc4386e89b94861de6a76b63aa&language=en_GB&ref_=as_li_ss_tl"),
                 linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B07QQK1Y8Z?th=1&linkCode=ll1&tag=techbee0f-21&linkId=358ffcc25e1975c748a1ec2e400e73dd&language=en_GB&ref_=as_li_ss_tl")
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
        linkAmazonNL: nil
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
        linkAmazonNL: nil
        ),
        BabyDanger(
            id: "PLANT_SOIL",
            objectIds: [263, 379, 491, 547],
            title: String("danger_plant_soil_title"),
            description: String("danger_plant_soil_text"),
            linkAliExpress: URL.init(string: "https://amzn.to/3jprGxm"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3jprGxm"),
            linkAmazonFR: URL.init(string: "https://www.amazon.fr/dp/B093B9ZNYJ?&linkCode=ll1&tag=techbee05e-21&linkId=15d35a375d372aeb54ac455c7f31c707&language=fr_FR&ref_=as_li_ss_tl"),                             // no Amazon FR link, pointing to Amazon DE!
                    linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B078HRLW2Q?&linkCode=ll1&tag=techbee067-21&linkId=0214f944472e5ba3b8552971b2653576&language=it_IT&ref_=as_li_ss_tl"),
                    linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B093K6J4Y9?&linkCode=ll1&tag=techbee093-21&linkId=a4c530c9bedde833dc40b3d4c2700907&language=pt_PT&ref_=as_li_ss_tl"),                             // no Amazon FR link, pointing to Amazon DE!
                    linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B09B2WXBW7?&linkCode=ll1&tag=techbee061-21&linkId=100f038c4a5d97d93166e8fa3258d2e9&language=en_GB&ref_=as_li_ss_tl"),
                    linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B06Y52B1H8?&linkCode=ll1&tag=techbee0f-21&linkId=6d822b40b8abe7ce4222b683fd2c4bb6&language=en_GB&ref_=as_li_ss_tl")
                    ),
        BabyDanger(
            id: "WASHING_MACHINE",
            objectIds: [40],
            title: String("danger_washingmachine_title"),
            description: String("danger_washingmachine_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_ALZLZH"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3KuEwq6"),
            linkAmazonFR: URL.init(string: "https://amzn.to/37kEP8J"),
                    linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B083928NGZ?&linkCode=ll1&tag=techbee067-21&linkId=89f835292455b5b84fb8002fbe816650&ref_=as_li_ss_tl"),
                    linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B07Z63WB78?&linkCode=ll1&tag=techbee093-21&linkId=163907feff970cb6087bee11a6ddf051&language=es_ES&ref_=as_li_ss_tl"),
                    linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B072KPZMMV?&linkCode=ll1&tag=techbee061-21&linkId=a59cbbfc4386e89b94861de6a76b63aa&language=en_GB&ref_=as_li_ss_tl"),
                    linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B07QQK1Y8Z?th=1&linkCode=ll1&tag=techbee0f-21&linkId=358ffcc25e1975c748a1ec2e400e73dd&language=en_GB&ref_=as_li_ss_tl")
                    ),
        BabyDanger(
            id: "HEATING",
            objectIds: [284],
            title: String("danger_radiator_title"),
            description: String("danger_radiator_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AtR09Z"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3E0x5EP"),
            linkAmazonFR: URL.init(string: "https://amzn.to/37kFjM5"),
                   linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B07B4H8TRK?&linkCode=ll1&tag=techbee067-21&linkId=0785ade6cc1c22e6957f2c312e551336&ref_=as_li_ss_tl"),
                   linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B07RLTT83P?&linkCode=ll1&tag=techbee093-21&linkId=4ab50fadea73e874f7519ed4aa379e1d&language=es_ES&ref_=as_li_ss_tl"),
                   linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B00U77TL3S?th=1&linkCode=ll1&tag=techbee061-21&linkId=87db362115911b9a2d7a3eb4733dbe06&language=en_GB&ref_=as_li_ss_tl"),
                   linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B077LZRGF9?&linkCode=ll1&tag=techbee0f-21&linkId=254d88693094ca2deff4905ee123446d&language=en_GB&ref_=as_li_ss_tl")
                   ),
        BabyDanger(
            id: "LIGHTBULB",
            objectIds: [57, 224, 269, 571],
            title: String("danger_lightbulb_title"),
            description: String("danger_lightbulb_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AYrbWP"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3DWJv0p"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3JRtYA8"),
                   linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B077RDPZ17?&linkCode=ll1&tag=techbee067-21&linkId=ac52ae0bcdaecb979297bc7787f6b851&ref_=as_li_ss_tl"),
                   linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B073QSXXCH?&linkCode=ll1&tag=techbee093-21&linkId=98571e02526ce15c1f3e54c79794da31&language=es_ES&ref_=as_li_ss_tl"),
                   linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B019QAU9PA?&linkCode=ll1&tag=techbee061-21&linkId=ea906fdc30b553f6d3c40230c1e293ea&language=en_GB&ref_=as_li_ss_tl"),
                   linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B06Y38639J?&linkCode=ll1&tag=techbee0f-21&linkId=e8a97b19df88e2712e3a781cc7764f2f&language=en_GB&ref_=as_li_ss_tl")
                   ),
        BabyDanger(
            id: "DOOR_PINCH",
            objectIds: [190, 258],
            title: String("danger_door_pinch_title"),
            description: String("danger_door_pinch_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AYkDmR"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3O3IBDG"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3EvMOvF"),
                    linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B083V4JN3T?&linkCode=ll1&tag=techbee067-21&linkId=adb6e85942944fd8ac28ac5d56cf3ee9&ref_=as_li_ss_tl"),
                    linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B09B389Z1M?&linkCode=ll1&tag=techbee093-21&linkId=66322e59da355f68957f9f5825c97d75&language=es_ES&ref_=as_li_ss_tl"),
                    linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B0199JMET2?&linkCode=ll1&tag=techbee061-21&linkId=b6ff3faca44ebb652baa4afb41713c8c&language=en_GB&ref_=as_li_ss_tl"),
                    linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B08523NJMY?th=1&linkCode=ll1&tag=techbee0f-21&linkId=b2c47dc5d255e0c26807dce74427aae2&language=en_GB&ref_=as_li_ss_tl")
                    ),
        BabyDanger(
            id: "DOOR_PINCHBACK",
            objectIds: [190, 258],
            title: String("danger_door_pinchback_title"),
            description: String("danger_door_pinchback_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AtHMrz"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3LX13Mn"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3EmCZjJ"),
                    linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B099K2GNPR?&linkCode=ll1&tag=techbee067-21&linkId=72cccc1a53e9b6dbd27a6916fd8b671d&language=it_IT&ref_=as_li_ss_tl"),
                    linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B07MF2Y5SV?&linkCode=ll1&tag=techbee093-21&linkId=59fbcb7364844526b27410bfab3269bb&language=pt_PT&ref_=as_li_ss_tl"),
                    linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B08CDXHLTH?&linkCode=ll1&tag=techbee061-21&linkId=2e8e916e7802fc7ec77baa37f715a6f7&language=en_GB&ref_=as_li_ss_tl"),
                    linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B000R59LSU?&linkCode=ll1&tag=techbee0f-21&linkId=43dbfbc91c8798d05f830641c970d6f1&language=en_GB&ref_=as_li_ss_tl")
                    ),
        BabyDanger(
            id: "DOOR_LOCKOUT",
            objectIds: [190, 258],
            title: String("danger_door_lockout_title"),
            description: String("danger_door_lockout_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_9xX5WX"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3us0uEt"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3rAtg3X"),
                    linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B084V46S6D?&linkCode=ll1&tag=techbee067-21&linkId=560e5379a419f902fe7498ca752fe185&ref_=as_li_ss_tl"),
                    linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B086J7988J?&linkCode=ll1&tag=techbee093-21&linkId=b82a3e6de841a1e94bc7da7df2ff60fe&language=es_ES&ref_=as_li_ss_tl"),
                    linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B07SSYTN7P?th=1&linkCode=ll1&tag=techbee061-21&linkId=5d427cb6a86fe9f1839131e22c95cec3&language=en_GB&ref_=as_li_ss_tl"),
                    linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B084V46S6D?&linkCode=ll1&tag=techbee0f-21&linkId=d8ef944d6c9bed2e6d3aaf673bb0c3b5&language=en_GB&ref_=as_li_ss_tl")
                    ),
        BabyDanger(
            id: "WINDOW",
            objectIds: [242, 519],
            title: String("danger_window_title"),
            description: String("danger_window_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AX0RiP"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3usE06m"),
            linkAmazonFR: URL.init(string: "https://amzn.to/36qHb5s"),
                    linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B01MDQZ7FK?&linkCode=ll1&tag=techbee067-21&linkId=4d03cdeebb82c3d2a914b7aac5128a6e&ref_=as_li_ss_tl"),
                    linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B07JN1SY3Q?&linkCode=ll1&tag=techbee093-21&linkId=c9ad328005a2c438a6d5dd51ea46e43c&language=pt_PT&ref_=as_li_ss_tl"),
                    linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B09FLS96F7?th=1&linkCode=ll1&tag=techbee061-21&linkId=358941d3787043f3a1003864fef5181f&language=en_GB&ref_=as_li_ss_tl"),
                    linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B09NQ738Y1?th=1&linkCode=ll1&tag=techbee0f-21&linkId=e802c792ef24917bccd3b32f684f80ea&language=en_GB&ref_=as_li_ss_tl")
                    ),
        BabyDanger(
            id: "STAIRS",
            objectIds: [],
            title: String("danger_stairs_title"),
            description: String("danger_stairs_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AK66fN"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3uqZbWk"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3Oi1wuF"),
            linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B08HQ4S586?&linkCode=ll1&tag=techbee067-21&linkId=95f184c1bac6ca50325c8786054d764e&ref_=as_li_ss_tl"),
            linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B0177W8HBW?th=1&linkCode=ll1&tag=techbee093-21&linkId=0cff3006225611e96098ca4a7829de6f&language=es_ES&ref_=as_li_ss_tl"),
            linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B001KC05PM?th=1&linkCode=ll1&tag=techbee061-21&linkId=dc077bff11d146dae76154a695fd9b9b&language=en_GB&ref_=as_li_ss_tl"),
            linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B01MY0UOQR?&linkCode=ll1&tag=techbee0f-21&linkId=1159667ac2dc244913f14571cd43f2e3&language=en_GB&ref_=as_li_ss_tl")
            ),
        BabyDanger(
            id: "HOT_WATER",
            objectIds: [21, 192, 201, 260],
            title: String("danger_hotwater_title"),
            description: String("danger_hotwater_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_9fyCuX"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3LQdsSo"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3vqdytx"),
                    linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B07PLWXX93?&linkCode=ll1&tag=techbee067-21&linkId=3063e04a156383bdc98d320213ed44f2&ref_=as_li_ss_tl"),
                    linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B09DG59BL2?&linkCode=ll1&tag=techbee093-21&linkId=d2aa824f98357691421802f1ae153805&language=es_ES&ref_=as_li_ss_tl"),
                    linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B07TX8QJGN?&linkCode=ll1&tag=techbee061-21&linkId=92beb385229dbdc95f4efa0f13a84ff4&language=en_GB&ref_=as_li_ss_tl"),
                    linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B00RTG1HSC?&linkCode=ll1&tag=techbee0f-21&linkId=758b2cee4b4a49f4f1464b373d6a58d5&language=en_GB&ref_=as_li_ss_tl")
                    ),
        BabyDanger(
            id: "BOILER",
            objectIds: [21, 192, 201, 260],
            title: String("danger_boiler_title"),
            description: String("danger_boiler_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_Ad2u1D"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3v0uTc0"),
            linkAmazonFR: URL.init(string: "https://amzn.to/36ocwpp"),
                   linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B089YVTBN1?&linkCode=ll1&tag=techbee067-21&linkId=0c89f058df485dfbf3020f2853d41d12&language=it_IT&ref_=as_li_ss_tl"),
                   linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B089YVTBN1?&linkCode=ll1&tag=techbee093-21&linkId=35bf89b092c0ff712fff4d8f51d8c6cb&language=es_ES&ref_=as_li_ss_tl"),
                   linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B089S62Y2L?&linkCode=ll1&tag=techbee061-21&linkId=b1ccb641b68a81a53b7190c2906cdcba&language=en_GB&ref_=as_li_ss_tl"),
                   linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B089YVTBN1?&linkCode=ll1&tag=techbee0f-21&linkId=e91ea19d47add1a440b242f203b2cc02&language=en_GB&ref_=as_li_ss_tl")
                   ),
        BabyDanger(
            id: "SUPPLIES",
            objectIds: [229, 387, 489, 620],
            title: String("danger_cleaning_supplies_title"),
            description: String("danger_cleaning_supplies_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AYOmND"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3E00ZJ1"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3OijOfs"),
                    linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B0788SG9WZ?&linkCode=ll1&tag=techbee067-21&linkId=985192f7794a748ea2303744665cb1c0&language=it_IT&ref_=as_li_ss_tl"),
                    linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B0788SG9WZ?&linkCode=ll1&tag=techbee093-21&linkId=cb89d4eb3e49bd58fafabfe0cc569b32&language=es_ES&ref_=as_li_ss_tl"),
                    linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B0746MZSJ6?th=1&linkCode=ll1&tag=techbee061-21&linkId=951f5ef1f1d82868c0a72a10f2901d8f&language=en_GB&ref_=as_li_ss_tl"),
                    linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B072PPT9V3?&linkCode=ll1&tag=techbee0f-21&linkId=b9bd24edbec0a3c2403941d620bb9379&language=en_GB&ref_=as_li_ss_tl")
                    ),
        BabyDanger(
            id: "SOFA",
            objectIds: [183, 291, 376],
            title: String("danger_sofa_title"),
            description: String("danger_sofa_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_9RGrp9"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3v0uBSs"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3voaRZn"),
                    linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B08ZSH8R7C?&linkCode=ll1&tag=techbee067-21&linkId=43db068e32f1ad02d0231e403793bb81&language=it_IT&ref_=as_li_ss_tl"),
                    linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B078682PBX?&linkCode=ll1&tag=techbee093-21&linkId=3f32a8388f844469c4d7a73b96448259&language=es_ES&ref_=as_li_ss_tl"),
                    linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B09VB6488S?th=1&linkCode=ll1&tag=techbee061-21&linkId=73e524fa12bc096536dc12741e446afb&language=en_GB&ref_=as_li_ss_tl"),
                    linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B08ZSH8R7C?th=1&linkCode=ll1&tag=techbee0f-21&linkId=a5530dcd793909f3be8a2d906d306f0d&language=en_GB&ref_=as_li_ss_tl")
                    ),
        BabyDanger(
            id: "OVEN",
            objectIds: [177, 211, 226, 302, 336, 438, 554],
            title: String("danger_oven_title"),
            description: String("danger_oven_text"),
            linkAliExpress: URL.init(string: "https://amzn.to/3JuB39H"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3JuB39H"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3JSAsib"),
                    linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B01M4MDJJH?&linkCode=ll1&tag=techbee067-21&linkId=7c250ea5a423e62893c9a12a9ac7328b&language=it_IT&ref_=as_li_ss_tl"),
                    linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B005N98974?&linkCode=ll1&tag=techbee093-21&linkId=289d6ce6165378da6d0c56d767d96d29&language=es_ES&ref_=as_li_ss_tl"),
                    linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B001CLWL4E?&linkCode=ll1&tag=techbee061-21&linkId=02efe08a406517329e3578895141925a&language=en_GB&ref_=as_li_ss_tl"),
                    linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B005N9BI5Y?th=1&linkCode=ll1&tag=techbee0f-21&linkId=1a74fa778a72174cc97bfde3093d3751&language=en_GB&ref_=as_li_ss_tl")
                    ),
        BabyDanger(
            id: "OVENSWITCH",
            objectIds: [177, 211, 226, 302, 554],
            title: String("danger_ovenswitch_title"),
            description: String("danger_ovenswitch_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_AkNyFV"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3DX6FUm"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3uRDYoY"),
                   linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B094V5YL4K?&linkCode=ll1&tag=techbee067-21&linkId=0f3f63052be698cb31c248513713ace8&language=it_IT&ref_=as_li_ss_tl"),
                   linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B08LVQH8YB?&linkCode=ll1&tag=techbee093-21&linkId=068bb2b8de8ad5ab2c1db6105929eec7&language=es_ES&ref_=as_li_ss_tl"),
                   linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B08G8KS5BJ?&linkCode=ll1&tag=techbee061-21&linkId=d4906610fccbdcfc21d9f54fe303a9a5&language=en_GB&ref_=as_li_ss_tl"),
                   linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B094V5YL4K?&linkCode=ll1&tag=techbee0f-21&linkId=88033e495ebc6b5328eb58ee994722c8&language=en_GB&ref_=as_li_ss_tl")
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
        linkAmazonNL: nil
        ),
        BabyDanger(
            id: "CANDLE",
            objectIds: [254, 292, 485],
            title: String("danger_candle_title"),
            description: String("danger_candle_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_A7ofYx"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3usDipI"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3jMhlvw"),
                    linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B07V5M8KYM?&linkCode=ll1&tag=techbee067-21&linkId=68b5b734f6d3ab57686d949b9de8ee3f&language=it_IT&ref_=as_li_ss_tl"),
                    linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B07CVC9W1N?&linkCode=ll1&tag=techbee093-21&linkId=a12f39c83c4d40ea7f6c979e8f0a682d&language=es_ES&ref_=as_li_ss_tl"),
                    linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B07VGX98HT?&linkCode=ll1&tag=techbee061-21&linkId=79198c3ad725b8b441a05b42e0a9d362&language=en_GB&ref_=as_li_ss_tl"),
                    linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B07CVC9W1N?&linkCode=ll1&tag=techbee0f-21&linkId=d6fe9a309ed3fa2b048eb79cb35a1d20&language=en_GB&ref_=as_li_ss_tl")
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
        linkAmazonNL: nil
        ),
        BabyDanger(
            id: "RAILING",
            objectIds: [],
            title: String("danger_railing_title"),
            description: String("danger_railing_text"),
            linkAliExpress: nil,
            linkAmazonDE: nil,
            linkAmazonFR: nil,
        linkAmazonIT: nil,
        linkAmazonES: nil,
        linkAmazonUK: nil,
        linkAmazonNL: nil),
        BabyDanger(
            id: "DISHWASHER",
            objectIds: [607],
            title: String("danger_dishwasher_title"),
            description: String("danger_dishwasher_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_ALZLZH"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3DZZnPt"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3EqJYI8"),
            linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B07QQK1Y8Z?&linkCode=ll1&tag=techbee067-21&linkId=86f75c9d0469602c52e28538984e956e&ref_=as_li_ss_tl"),
            linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B07QQK1Y8Z?th=1&linkCode=ll1&tag=techbee093-21&linkId=7436319979705ad5a6b6429db133e452&language=es_ES&ref_=as_li_ss_tl"),
            linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B072KPZMMV?&linkCode=ll1&tag=techbee061-21&linkId=dff1210fca9a3ccc78589d26a75d8a11&language=en_GB&ref_=as_li_ss_tl"),
            linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B07QQK1Y8Z?th=1&linkCode=ll1&tag=techbee0f-21&linkId=358ffcc25e1975c748a1ec2e400e73dd&language=en_GB&ref_=as_li_ss_tl")
            ),
        BabyDanger(
            id: "CABLE",
            objectIds: [61, 479, 573],
            title: String("danger_cable_title"),
            description: String("danger_cable_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_9I0Vlz"),
            linkAmazonDE: URL.init(string: "https://amzn.to/35YYNoN"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3ryyzBb"),
            linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B08J42M6H3?&linkCode=ll1&tag=techbee067-21&linkId=6b1c226ebd11f288d51b9c4ee24bb5c5&ref_=as_li_ss_tl"),
            linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B073YL3HMC?th=1&linkCode=ll1&tag=techbee093-21&linkId=9a0f57d81a82acaebf00c1f474896580&language=pt_PT&ref_=as_li_ss_tl"),
            linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B08S3ZF3LY?th=1&linkCode=ll1&tag=techbee061-21&linkId=ad7837e01422c2e8a482a4d706f9687c&language=en_GB&ref_=as_li_ss_tl"),
            linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B07PFHDT9K?th=1&linkCode=ll1&tag=techbee0f-21&linkId=7874b5f55d0a3f1c680f3d02e694ec95&language=en_GB&ref_=as_li_ss_tl")
     ),
        BabyDanger(
            id: "POOL",
            objectIds: [260],
            title: String("danger_pool_title"),
            description: String("danger_pool_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_9ijPoj"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3rbRD7W"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3uQF2cq"),
            linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B014FM7OJS?&linkCode=ll1&tag=techbee067-21&linkId=0e78819560ff562d12abdf75481168ba&ref_=as_li_ss_tl"),
            linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B014FM7OJS?&linkCode=ll1&tag=techbee093-21&linkId=205beb7c006e6449013fd31ead4a1151&language=pt_PT&ref_=as_li_ss_tl"),
            linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B00UHNCA3K?&linkCode=ll1&tag=techbee061-21&linkId=49a05d5874a8eaa386b45d81d1e193f3&language=en_GB&ref_=as_li_ss_tl"),
            linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B00004YTIQ?&linkCode=ll1&tag=techbee0f-21&linkId=7020d5d4349a6ce4a2bd15a54f4474f8&language=en_GB&ref_=as_li_ss_tl")
           ),
        BabyDanger(
            id: "KNIFE",
            objectIds: [20, 59, 66, 73, 93, 95, 105, 186, 277, 320, 356, 531],
            title: String("danger_knife_title"),
            description: String("danger_knife_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_98SBAX"),
                    linkAmazonDE: URL.init(string: "https://amzn.to/3uqRf7y"),
                    linkAmazonFR: URL.init(string: "https://amzn.to/3Eq6D7z"),
                    linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B095C3FWHD?&linkCode=ll1&tag=techbee067-21&linkId=6d5d5a8f214c9a8700c8388bde9dac8f&ref_=as_li_ss_tl"),
                    linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B06Y6RWF9H?&linkCode=ll1&tag=techbee093-21&linkId=362388fa51b834d36238777ffec8463c&language=pt_PT&ref_=as_li_ss_tl"),
                    linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B09GFP7SDM?&linkCode=ll1&tag=techbee061-21&linkId=36468dd8ab2dd606623dc03f168b607e&language=en_GB&ref_=as_li_ss_tl"),
                    linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B08QH5LT76?&linkCode=ll1&tag=techbee0f-21&linkId=d54b353003db9618a2c130d7226bfa45&language=en_GB&ref_=as_li_ss_tl")
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
        linkAmazonNL: nil),
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
            linkAmazonNL: nil
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
            linkAmazonNL: nil
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
            linkAmazonNL: nil
        ),
        BabyDanger(
            id: "CUTLERY",
            objectIds: [59, 320, 356, 504, 531],
            title: String("danger_cutlery_title"),
            description: String("danger_cutlery_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_APauDD"),
                    linkAmazonDE: URL.init(string: "https://amzn.to/3E70H3m"),
                    linkAmazonFR: URL.init(string: "https://amzn.to/3xvcGq6"),
                    linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B01HMQ0Q2G?&linkCode=ll1&tag=techbee067-21&linkId=d55d5d6a22bb30e707bd30fbed1a0cb8&ref_=as_li_ss_tl"),
                    linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B08DM9CHHL?th=1&linkCode=ll1&tag=techbee093-21&linkId=77cc085e0be3b5666cad47aaf2da9fd9&language=pt_PT&ref_=as_li_ss_tl"),
                    linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B01HMQ0Q2G?th=1&linkCode=ll1&tag=techbee061-21&linkId=eb1fcba38ebc4f234b937c7f2d3b54a7&language=en_GB&ref_=as_li_ss_tl"),
                    linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B00BHH1AKY?&linkCode=ll1&tag=techbee0f-21&linkId=a6860337985bad215d58f81fee4b5ed8&language=en_GB&ref_=as_li_ss_tl")
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
            linkAmazonNL: nil
        ),
        BabyDanger(
            id: "MIRROR",
            objectIds: [348],
            title: String("danger_mirror_title"),
            description: String("danger_mirror_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_99ezSJ"),
                    linkAmazonDE: URL.init(string: "https://amzn.to/3JzPSrK"),
                    linkAmazonFR: URL.init(string: "https://amzn.to/3vpvC6P"),
                    linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B01HIGYK90?&linkCode=ll1&tag=techbee067-21&linkId=bc42d163ce3f22b74374378161f9517f&language=it_IT&ref_=as_li_ss_tl"),
                    linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B07S6QP9KS?th=1&linkCode=ll1&tag=techbee093-21&linkId=b82f31f6a28a179e4e51492598cf386b&language=pt_PT&ref_=as_li_ss_tl"),
                    linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B07SF5H3X6?th=1&linkCode=ll1&tag=techbee061-21&linkId=48e27f159520aab43378375ba28af141&language=en_GB&ref_=as_li_ss_tl"),
                    linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B01I4J5DMS?&linkCode=ll1&tag=techbee0f-21&linkId=f8d66b1600c288725b82a5b3665d1a5c&language=en_GB&ref_=as_li_ss_tl")
                    ),
        BabyDanger(
            id: "FIREPLACE",
            objectIds: [292],
            title: String("danger_fireplace_title"),
            description: String("danger_fireplace_text"),
            linkAliExpress: URL.init(string: "https://s.click.aliexpress.com/e/_ArtoJz"),
            linkAmazonDE: URL.init(string: "https://amzn.to/3v9UNKu"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3Me0XAa"),
                    linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B079S6JRW6?&linkCode=ll1&tag=techbee067-21&linkId=1c13d4b428bb71887abc24fb49d2665b&ref_=as_li_ss_tl"),
                    linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B07F8K4Q2V?&linkCode=ll1&tag=techbee093-21&linkId=3ac893e8b553f736b828b47d4701bcfc&language=es_ES&ref_=as_li_ss_tl"),
                    linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B07WYF4T9M?&linkCode=ll1&tag=techbee061-21&linkId=d85c232d0153f6302dbc7d68641ba778&language=en_GB&ref_=as_li_ss_tl"),
                    linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B079S6JRW6?&linkCode=ll1&tag=techbee0f-21&linkId=206966cfca72caefa2e66c2a5ecc891e&language=en_GB&ref_=as_li_ss_tl")
                    ),
        BabyDanger(
            id: "WEAPONS",
            objectIds: [85, 386, 394, 398, 435, 470, 487, 565],
            title: String("danger_weapons_title"),
            description: String("danger_weapons_text"),
            linkAliExpress: URL.init(string: "https://amzn.to/3xfRqEu"),                // no AliExpress Product!!!
            linkAmazonDE: URL.init(string: "https://amzn.to/3xfRqEu"),
            linkAmazonFR: URL.init(string: "https://amzn.to/3Elnicx"),
            linkAmazonIT: URL.init(string: "https://www.amazon.it/dp/B00JOOM7R2?&linkCode=ll1&tag=techbee067-21&linkId=5ffbdf724444baf9d62cdce735ae9b1d&language=it_IT&ref_=as_li_ss_tl"),
            linkAmazonES: URL.init(string: "https://www.amazon.es/dp/B078K4W8N9?th=1&linkCode=ll1&tag=techbee093-21&linkId=910d9964eb3bd49b5742c898dda1aadd&language=pt_PT&ref_=as_li_ss_tl"),
            linkAmazonUK: URL.init(string: "https://www.amazon.co.uk/dp/B097XW4BY7?th=1&linkCode=ll1&tag=techbee061-21&linkId=2cbd94621b942522f13a56d4a56b7e60&language=en_GB&ref_=as_li_ss_tl"),
            linkAmazonNL: URL.init(string: "https://www.amazon.nl/dp/B075WR3M3X?th=1&linkCode=ll1&tag=techbee0f-21&linkId=b34b0729ade1577a50535f893de06ed3&language=en_GB&ref_=as_li_ss_tl")
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
