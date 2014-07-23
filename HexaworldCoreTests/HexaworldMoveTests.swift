//
//  HexaworldMoveTests.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/21/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import XCTest
import HexaworldCore

class HexaworldMoveTests: XCTestCase {
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

    func test_should_move_down_to_fill_empty_cell() {
        let cellFrom = world[originalCellColumn, originalCellRow]
        
        world[originalCellColumn, originalCellRow - 1] = nil

        world.fillHoles(.Down)
        
        let cellAfterBeMoved = world[originalCellColumn, originalCellRow - 1]
        
        if let realCell = cellAfterBeMoved? {
            XCTAssertTrue(cellFrom! === realCell)
        } else {
            XCTFail()
        }
        
    }

}
