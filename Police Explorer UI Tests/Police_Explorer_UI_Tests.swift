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
    
}
