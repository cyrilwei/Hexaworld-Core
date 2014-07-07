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
    let expectedColumns = 5
    let expectedRows = 3

    var world = Hexaworld(columns: 0, rows: 0)

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        world = Hexaworld(columns: expectedColumns, rows: expectedRows)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_should_create_hexaworld_with_width_and_height() {
        XCTAssertEqual(expectedColumns, world.columns)
        XCTAssertEqual(expectedRows, world.rows)
    }
    
    func test_should_have_17_cells_in_5_by_3_world() {
        XCTAssertEqual(17, world.cells.count)
    }
    
    func test_should_return_cell_at_position_0_1() {
        let cell = world[0, 1]
        if let realCell = cell? {
            // should be success
        } else {
            XCTFail()
        }
    }
    
    func test_should_return_nil_at_illegal_position() {
        let cell = world[expectedColumns, expectedRows]
        if let realCell = cell? {
            XCTFail()
        }
    }
    
    func test_odd_indexed_column_should_have_1_more_cell() {
        let cell = world[1, expectedRows]
        if let realCell = cell? {
            // should be success
        } else {
            XCTFail()
        }
    }

    func test_even_indexed_column_should_have_normal_cell_count() {
        let cell = world[2, expectedRows]
        if let realCell = cell? {
            XCTFail()
        }
    }
}
