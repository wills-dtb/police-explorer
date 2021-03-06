//
//  Police_Explorer_UI_Tests.swift
//  Police Explorer UI Tests
//
//  Created by Aaron McTavish on 05/04/2018.
//

import XCTest

class Police_Explorer_UI_Tests: XCTestCase {
    let app = XCUIApplication()
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        app.terminate()
    }
    
    func testCrimeDetailsPage() {

        // Given the map is on the screen - differentiate between land and sea
        // No content :(

        // And
        repeat {
            app.doubleTap()
        } while !app.tables.cells.element(boundBy: 0).exists

        // When
        app.tables.cells.element(boundBy: 0).tap()

        // Then
        XCTAssertNotNil(Accessibility.CrimeDetailLabel)
    }

    func testBackNavigation() {

        fullZoomIntoView()
        app.tables.cells.element(boundBy: 0).tap()

        // Given
        XCTAssertTrue(app.staticTexts[Accessibility.CrimeDetailLabel].isEnabled)

        // When
        app.navigationBars["Crime Details"].buttons["Crimes"].tap()

        // Then
        XCTAssertTrue(app.navigationBars["Crimes"].exists, "The app is not on the home screen")

    }

    func testCrimeTableScrollView() {
        fullZoomIntoView()
        if (app.tables.cells.count > 8) {

            // When
            app.tables.cells.element(boundBy: 0).swipeUp()

            // Then
            XCTAssertFalse(app.tables.cells.element(boundBy: 0).isHittable)
        }
    }

//    func testCompassOnMapBehaves() {
//
//        let query: XCUIElementQuery = app.maps
//        let map: XCUIElement = query["MyMapId"]
//
//        let map: XCUIElement = app.maps.firstMatch
//        let angle = angleInRadians(90)
//
//
//        sleep(4)
//
//        XCTAssertTrue(map.exists)
//
//        map.rotate(angle, withVelocity: 1.0)
//
//        let button = app.buttons["Compass"]
//        button.tap()
//
//    }
//
//    func angleInRadians(_ degrees: CGFloat) -> CGFloat {
//        return CGFloat(90) * CGFloat.pi / 180
//    }

//    func testUserInUKByDefault() {
//
//        let predicate = NSPredicate(format: "exists == 1")
//        let query = app.otherElements[Accessibility.UnitedKingdom]
//        expectation(for: predicate, evaluatedWith: query, handler: nil)
//        waitForExpectations(timeout: 7, handler: nil)
//
//        // When
//        app.doubleTap()
//
//        // Then
//        let ukCities = app.descendants(matching: .valueIndicator).otherElements[Accessibility.UnitedKingdom]
//        XCTAssert(ukCities.exists)
//    }

    private func fullZoomIntoView() {
        repeat {
            app.doubleTap()
        } while !app.tables.cells.element(boundBy: 0).exists
    }

    
    
}
