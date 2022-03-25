//
//  Babysafe_Home_AR_iOS_SwiftUIUITestsLaunchTests.swift
//  Babysafe Home AR iOS SwiftUIUITests
//
//  Created by Patrick Lang on 25.03.22.
//

import XCTest

class Babysafe_Home_AR_iOS_SwiftUIUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
