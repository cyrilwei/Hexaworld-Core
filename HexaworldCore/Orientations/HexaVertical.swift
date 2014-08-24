//
//  HexaVertical.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/23/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

class HexaVertical: HexaOrientation {
    init() {
        super.init(xFactor: 1.5, yFactor: M_2_COS_PI_6)
    }
    
    override func offsetForDirection(direction: HexaDirection) -> (Int, Int) {
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
    
    override func directionFromOffset(columnOffset: Int, rowOffset: Int) -> HexaDirection {
        var direction: HexaDirection
        
        switch (columnOffset, rowOffset) {
        case (0, -1):
            direction = .Up
        case (+1, -1):
            direction = .RightUp
        case (+1, 0):
            direction = .RightDown
        case (0, +1):
            direction = .Down
        case (-1, 0):
            direction = .LeftDown
        case (-1, -1):
            direction = .LeftUp
        default:
            direction = super.directionFromOffset(columnOffset, rowOffset: rowOffset)
        }
        
        return direction
    }
}