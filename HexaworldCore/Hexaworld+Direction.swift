//
//  Hexaworld+Direction.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/15/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

enum HexaworldDirection {
    case Up
    case RightUp
    case Right
    case RightDown
    case Down
    case LeftDown
    case Left
    case LeftUp
}

extension Hexaworld {
    func cellFromCell(cell: HexaworldCell, direction: HexaworldDirection) -> HexaworldCell? {
        let (columnOffset, rowOffset) = layout.offsetForDirection(direction)
        
        return self[cell.column + columnOffset, cell.row + rowOffset]
    }
}