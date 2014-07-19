//
//  Hexaworld+Direction.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/15/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

enum HexaDirection {
    case Up
    case RightUp
    case Right
    case RightDown
    case Down
    case LeftDown
    case Left
    case LeftUp
    case Unsupported
}

extension Hexaworld {
    func cellFromCell(cell: HexaworldCell, direction: HexaDirection) -> HexaworldCell? {
        let (columnOffset, rowOffset) = layout.offsetForDirection(direction)
        
        return self[cell.column + columnOffset, cell.row + rowOffset]
    }
}