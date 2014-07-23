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
}