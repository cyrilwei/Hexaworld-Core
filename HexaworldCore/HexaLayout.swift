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
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
    }
    
    func cellIndex(column: Int, row: Int) -> Int {
        return HEXA_NOT_FOUND
    }
    
    func offsetForDirection(direction: HexaworldDirection) -> (Int, Int) {
        return (Int.max, Int.max)
    }
}