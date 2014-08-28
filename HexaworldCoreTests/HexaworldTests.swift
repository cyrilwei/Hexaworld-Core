//
//  HexaworldTests.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 8/28/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import UIKit
import XCTest
import HexaworldCore

class HexaworldTests: XCTestCase {
    let expectedColumns = 5
    let expectedRows = 3
    
    var world = Hexaworld<Int>(layout: HexaLayout.createRectHorizontalLayout(0, rows: 0))
    
    override func setUp() {
        super.setUp()

        world = Hexaworld<Int>(layout: HexaLayout.createRectHorizontalLayout(expectedColumns, rows: expectedRows))

        world.fill { (x, y, z) -> Int in
            return x << 8 + z
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_should_return_correct_size() {
        XCTAssertEqual(expectedColumns, world.columns)
        XCTAssertEqual(expectedRows, world.rows)
    }
    
    func test_should_return_correct_cell() {
        let cell = world[1, 1]
        
        XCTAssertEqual(1 << 8 + 1, cell!)
    }
    
    func test_should_return_nil_if_index_out_of_boundary() {
        let cell = world[expectedColumns + 1, expectedRows]
        
        XCTAssertNil(cell)
    }
}
