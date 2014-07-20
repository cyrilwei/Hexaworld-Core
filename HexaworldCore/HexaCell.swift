//
//  HexaCell.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/7/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

class HexaCell: Hashable {
    var column: Int
    var row: Int
    
    var movable: Bool = true
    
    init(column: Int, row: Int) {
        self.column = column
        self.row = row
    }

    var hashValue: Int {
        return row * HEXA_HASH_SHIFT + column
    }
}

func ==(lhs: HexaCell, rhs: HexaCell) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row
}