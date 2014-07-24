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
        super.init(columns: columns, rows: rows, orientation: HexaPortrait())
    }
    
    public override func cellIndex(column: Int, row: Int) -> Int {
        if row >= rows || column < 0 || row < 0 {
            return HEXA_NOT_FOUND
        }
        
        if row % 2 == 0 && column >= columns {
            return HEXA_NOT_FOUND
        }
        
        if row % 2 == 1 && column > columns {
            return HEXA_NOT_FOUND
        }
        
        return row * columns + column + row / 2
    }
}