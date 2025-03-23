//
//  MealsViewUITests.swift
//  University Mobile ExerciseTests
//
//  Created by Azizbek Asadov on 21.03.2025.
//

import Foundation
import XCTest

@testable import University_Mobile_Exercise

final class MealsViewUITests: XCTestCase {
    private var app: XCUIApplication = .init()
    
    override func setUpWithError() throws {
            continueAfterFailure = false
            app.launch()
            navigateToMealsTab()
        }

        private func navigateToMealsTab() {
            let mealsTab = app.tabBars.buttons.element(boundBy: 1) // Meals tab index
            XCTAssertTrue(mealsTab.waitForExistence(timeout: 3), "Meals tab should be available")
            mealsTab.tap()
        }

    func test_isMealCardViewAccessible() {
        navigateToMealsTab()
    }
}
