//
//  HexaworldSwapTests.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/9/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import XCTest
import HexaworldCore

class HexaworldSwapTests: XCTestCase {
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
    
    func test_cell_c1r1_should_be_at_c1r0_after_swapped_with_it() {
        let originalCellColumn = 1
        let originalCellRow = 1
        let cellFrom = world[originalCellColumn, originalCellRow]
        
        let cellTO = world.swap(cellFrom!, toDirection: .Up)

        let cellAfterBeSwapped = world[originalCellColumn, originalCellRow - 1]
        
        if let realCell = cellAfterBeSwapped? {
            XCTAssertTrue(cellFrom! === realCell)
        } else {
            XCTFail()
        }
    }

    func test_cell_should_have_new_position_info_after_be_swapped() {
        let originalCellColumn = 1
        let originalCellRow = 1
        let cellFrom = world[originalCellColumn, originalCellRow]
        
        let cellTo = world.swap(cellFrom!, toDirection: .Up)
        
        if let realCellFrom = cellFrom? {
            XCTAssertEqual(originalCellColumn, realCellFrom.column)
            XCTAssertEqual(originalCellRow - 1, realCellFrom.row)
        } else {
            XCTFail()
        }

        if let realCellTo = cellTo? {
            XCTAssertEqual(originalCellColumn, realCellTo.column)
            XCTAssertEqual(originalCellRow, realCellTo.row)
        } else {
            XCTFail()
        }
    }

}
