//
//  HexaHorizontal.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/23/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

public class HexaHorizontal: HexaOrientation {
    public init() {
        super.init(xFactor: M_2_COS_PI_6, yFactor: 1.5)
    }
    
    override public func offsetForDirection(direction: HexaDirection) -> (Int, Int) {
        var qOffset: Int;
        var rOffset: Int;
        
        switch direction {
            case .RightUp:
                qOffset = +1
                rOffset = -1
            case .Right:
                qOffset = +1
                rOffset = 0
            case .RightDown:
                qOffset = 0
                rOffset = +1
            case .LeftDown:
                qOffset = -1
                rOffset = +1
            case .Left:
                qOffset = -1
                rOffset = 0
            case .LeftUp:
                qOffset = 0
                rOffset = -1
            default:
                (qOffset, rOffset) = super.offsetForDirection(direction)
        }
        
        return (qOffset, rOffset)
    }
    
    override public func directionFromOffset(qOffset: Int, rOffset: Int) -> HexaDirection {
        var direction: HexaDirection
        
        switch (qOffset, rOffset) {
            case (+1, -1):
                direction = .RightUp
            case (+1, 0):
                direction = .Right
            case (0, +1):
                direction = .RightDown
            case (-1, +1):
                direction = .LeftDown
            case (-1, 0):
                direction = .Left
            case (0, -1):
                direction = .LeftUp
            default:
                direction = super.directionFromOffset(qOffset, rOffset: rOffset)
        }
        
        return direction
    }
}