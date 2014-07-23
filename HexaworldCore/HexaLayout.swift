//
//  HexaLayout.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/11/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

let HEXA_NOT_FOUND = -1

class HexaLayout {
    let columns: Int
    let rows: Int
    
    let orientation: HexaOrientation
    
    init(columns: Int, rows: Int, orientation: HexaOrientation) {
        self.columns = columns
        self.rows = rows
        
        self.orientation = orientation
    }
    
    func cellIndex(column: Int, row: Int) -> Int {
        return HEXA_NOT_FOUND
    }
    
    func offsetForDirection(direction: HexaDirection) -> (Int, Int) {
        return orientation.offsetForDirection(direction)
    }
    
    func directionFromOffset(columnOffset: Int, rowOffset: Int) -> HexaDirection {
        return orientation.directionFromOffset(columnOffset, rowOffset: rowOffset)
    }
}