//
//  HexaCell.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/7/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

public class HexaCell: Hashable {
    public var column: Int
    public var row: Int
    
    public var movable: Bool = true
    
    public init(column: Int, row: Int) {
        self.column = column
        self.row = row
    }

    public var hashValue: Int {
        return row * HEXA_HASH_SHIFT + column
    }
}

public func ==(lhs: HexaCell, rhs: HexaCell) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row
}