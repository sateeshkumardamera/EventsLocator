//
//  EventLocatorTests.swift
//  EventLocatorTests
//
//  Created by Sateesh Damera on 7/12/21.
//

import XCTest
@testable import EventLocator

class EventLocatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitEventsTableView() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let eventsViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        _ = eventsViewController.view
        XCTAssertNotNil(eventsViewController.eventsTable)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
