//
//  MVVM_Clean_Architecture_principles_SwiftUI_UITestsLaunchTests.swift
//  MVVM-Clean-Architecture-principles-SwiftUI-UITests
//
//  Created by Sam's Mac on 05/09/25.
//

import XCTest

final class MVVM_Clean_Architecture_principles_SwiftUI_UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
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
