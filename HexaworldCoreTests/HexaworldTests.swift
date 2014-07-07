//
//  HexaworldTests.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/6/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import XCTest
import HexaworldCore

class HexaworldTests: XCTestCase {
    let expectedWidth = 5
    let expectedHeight = 3
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_should_create_hexaworld_with_width_and_height() {
        let world = Hexaworld(width: expectedWidth, height: expectedHeight)
        XCTAssertEqual(expectedWidth, world.width)
        XCTAssertEqual(expectedHeight, world.height)
    }
    
    func test_should_have_15_cells_in_5_by_3_world() {
        let world = Hexaworld(width: expectedWidth, height: expectedHeight)
        XCTAssertEqual(15, world.cellCount)
    }
    
    func test_should_return_cell_at_position() {
        let world = Hexaworld(width: expectedWidth, height: expectedHeight)
        let cell = world.cellAt(1)
        if let realCell = cell? {
            // should be success
        } else {
            XCTFail()
        }
    }
    
    func test_should_return_nil_at_illegal_position() {
        let world = Hexaworld(width: expectedWidth, height: expectedHeight)
        let cell = world.cellAt(expectedWidth * expectedHeight)
        if let realCell = cell? {
            XCTFail()
        }
    }

}
