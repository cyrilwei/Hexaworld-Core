//
//  HexaRectLayoutTests.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/11/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import XCTest
import HexaworldCore

class HexaRectLayoutTests: XCTestCase {
    let expectedColumns = 5
    let expectedRows = 3

    var layout: HexaLayout!
    
    override func setUp() {
        super.setUp()

        layout = HexaLayout.createRectLandscapeLayout(expectedColumns, rows: expectedRows)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_should_create_HexaRectLayout_with_columns_and_rows() {
        XCTAssertTrue(layout is HexaRectLayout)
    }
    
    func test_should_return_offset_for_direction_up() {
        let (columnOffset, rowOffset) = layout.offsetForDirection(.Up)
        
        XCTAssertEqual(0, columnOffset)
        XCTAssertEqual(-1, rowOffset)
    }
    
    func test_should_return_direction_up_for_offset() {
        let direction = layout.directionFromOffset(0, rowOffset: -1)
        
        XCTAssertEqual(HexaDirection.Up, direction)
    }
    
    func test_should_return_invalid_offset_for_direction_right() {
        let (columnOffset, rowOffset) = layout.offsetForDirection(.Right)
        
        XCTAssertEqual(Int.max, columnOffset)
        XCTAssertEqual(Int.max, rowOffset)
    }

    func test_should_return_unsupported_direction_for_invalid_offset() {
        let direction = layout.directionFromOffset(2, rowOffset: 0)
        
        XCTAssertEqual(HexaDirection.Unsupported, direction)
    }
}
