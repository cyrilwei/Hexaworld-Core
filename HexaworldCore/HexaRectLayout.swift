//
//  HexaRectLayout.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/11/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

class HexaRectLayout: HexaLayout {
    init(columns: Int, rows: Int) {
        super.init(columns: columns, rows: rows)
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
    
    override func offsetForDirection(direction: HexaworldDirection) -> (Int, Int) {
        var columnOffset: Int;
        var rowOffset: Int;

        switch direction {
        case .Up:
            columnOffset = 0
            rowOffset = -1
        case .RightUp:
            columnOffset = +1
            rowOffset = -1
        case .RightDown:
            columnOffset = +1
            rowOffset = 0
        case .Down:
            columnOffset = 0
            rowOffset = +1
        case .LeftDown:
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
}