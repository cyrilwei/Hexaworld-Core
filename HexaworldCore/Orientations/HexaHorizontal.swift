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
    
    override public func offsetForDirection(_ direction: HexaDirection) -> (Int, Int) {
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
    
    override public func directionFromOffset(_ qOffset: Int, rOffset: Int) -> HexaDirection {
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
    
    override public func directionFromDegree(_ degree: Int) -> HexaDirection {
        var direction: HexaDirection = .Unsupported
        switch degree {
        case 0..<60:
            direction = .RightDown
        case 60..<120:
            direction = .Right
        case 120..<180:
            direction = .RightUp
        case 180..<240:
            direction = .LeftUp
        case 240..<300:
            direction = .Left
        case 300..<360:
            direction = .LeftDown
        default:
            direction = .Unsupported
        }

        return direction
    }
    
    override public func pointFromPoint(_ point: HexaPoint?, direction: HexaDirection) -> HexaPoint? {
        if point == nil {
            return nil
        }
        
        let (qOffset, rOffset) = offsetForDirection(direction)
        
        if qOffset != Int.max && rOffset != Int.max {
            return HexaPoint(axial: (point!.q + qOffset, point!.r + rOffset))
        }
        
        return super.pointFromPoint(point, direction: direction)
    }

    public override func enumerateSupported(_ enumerateBlock: (HexaDirection) -> ()) {
        for dir in 1...8 {
            if let direction = HexaDirection(rawValue: dir) {
                if direction == .Up || direction == .Down {
                    continue
                }

                enumerateBlock(direction)
            }
        }
    }
}
