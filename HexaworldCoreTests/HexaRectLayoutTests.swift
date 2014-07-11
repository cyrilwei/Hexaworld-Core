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

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_should_create_HexaRectLayout_with_columns_and_rows() {
        let layout = HexaLayout.createLayout(expectedColumns, rows: expectedRows)
        
        XCTAssertTrue(layout is HexaRectLayout)
    }
}
