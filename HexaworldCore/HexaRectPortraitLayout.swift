//
//  HexaRectPortraitLayout.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/22/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

class HexaRectPortraitLayout: HexaLayout {
    init(columns: Int, rows: Int) {
        super.init(columns: columns, rows: rows, orientation: .Portrait)
    }
    
    override func cellIndex(column: Int, row: Int) -> Int {
        if column >= columns || column < 0 || row < 0 {
            return HEXA_NOT_FOUND
        }
        
        if column % 2 == 0 && row >= rows {
            return HEXA_NOT_FOUND
        }
        
        if column % 2 == 1 && row > rows {
            return HEXA_NOT_FOUND
        }
        
        return column * rows + row + column / 2
    }
    
    override func offsetForDirection(direction: HexaDirection) -> (Int, Int) {
        var columnOffset: Int;
        var rowOffset: Int;
        
        switch direction {
        case .RightUp:
            columnOffset = 0
            rowOffset = -1
        case .Right:
            columnOffset = +1
            rowOffset = 0
        case .RightDown:
            columnOffset = 0
            rowOffset = +1
        case .LeftDown:
            columnOffset = -1
            rowOffset = +1
        case .Left:
            columnOffset = -1
            rowOffset = 0
        case .LeftUp:
            columnOffset = -1
            rowOffset = -1
        default:
            (columnOffset, rowOffset) = super.offsetForDirection(direction)
        }
        
        return (columnOffset, rowOffset)
    }
    
    override func directionFromOffset(columnOffset: Int, rowOffset: Int) -> HexaDirection {
        var direction: HexaDirection
        
        switch (columnOffset, rowOffset) {
        case (0, -1):
            direction = .RightUp
        case (+1, 0):
            direction = .Right
        case (0, +1):
            direction = .RightDown
        case (-1, +1):
            direction = .LeftDown
        case (-1, 0):
            direction = .Left
        case (-1, -1):
            direction = .LeftUp
        default:
            direction = super.directionFromOffset(columnOffset, rowOffset: rowOffset)
        }
        
        return direction
    }
}