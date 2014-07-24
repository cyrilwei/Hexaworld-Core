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

    let originalCellColumn = 1
    let originalCellRow = 1

    var world: Hexaworld!
        
    override func setUp() {
        super.setUp()
        
        world = Hexaworld(layout: HexaLayout.createRectLandscapeLayout(expectedColumns, rows: expectedRows))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_cell_c1r1_should_be_at_c1r0_after_swapped_with_it() {
        let cellFrom = world[originalCellColumn, originalCellRow]
        
        let cellTO = world.swap(cellFrom!, toDirection: .Up)

        let cellAfterBeSwapped = world[originalCellColumn, originalCellRow - 1]
        
        if let realCell = cellAfterBeSwapped? {
            XCTAssertTrue(cellFrom! === realCell)
        } else {
            XCTFail()
        }
    }

    func test_cell_c1r1_should_not_move_if_target_is_unmovable() {
        let cellFrom = world[originalCellColumn, originalCellRow]
        
        let targetCell = world[originalCellColumn, originalCellRow - 1]
        targetCell!.movable = false
        
        let cellTO = world.swap(cellFrom!, toDirection: .Up)
        
        let cellAfterBeSwapped = world[originalCellColumn, originalCellRow - 1]
        
        if let realCell = cellAfterBeSwapped? {
            XCTAssertFalse(cellFrom! === realCell)
        } else {
            XCTFail()
        }
    }

    func test_cell_c1r1_should_not_move_if_itself_is_unmovable() {
        let cellFrom = world[originalCellColumn, originalCellRow]
        cellFrom!.movable = false
        
        let cellTO = world.swap(cellFrom!, toDirection: .Up)
        
        let cellAfterBeSwapped = world[originalCellColumn, originalCellRow - 1]
        
        if let realCell = cellAfterBeSwapped? {
            XCTAssertFalse(cellFrom! === realCell)
        } else {
            XCTFail()
        }
    }

    func test_cell_should_have_new_position_info_after_be_swapped() {
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
    
    func test_can_not_swap_if_target_is_unmovable() {
        let cellFrom = world[originalCellColumn, originalCellRow]
        
        let targetCell = world[originalCellColumn, originalCellRow - 1]
        targetCell!.movable = false
        
        XCTAssertFalse(world.canSwap(cellFrom!, toDirection: .Up))
    }

    func test_can_swap_if_target_is_movable() {
        let cellFrom = world[originalCellColumn, originalCellRow]
        
        let targetCell = world[originalCellColumn, originalCellRow - 1]
        targetCell!.movable = true
        
        XCTAssertTrue(world.canSwap(cellFrom!, toDirection: .Up))
    }

    func test_can_not_swap_if_source_is_unmovable() {
        let cellFrom = world[originalCellColumn, originalCellRow]
        cellFrom!.movable = false
        
        XCTAssertFalse(world.canSwap(cellFrom!, toDirection: .Up))
    }

}
