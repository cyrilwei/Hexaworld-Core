//
//  HexaVertical.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/23/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

//public class HexaVertical: HexaOrientation {
//    public init() {
//        super.init(xFactor: 1.5, yFactor: M_2_COS_PI_6)
//    }
//    
//    override public func offsetForDirection(direction: HexaDirection) -> (Int, Int) {
//        var qOffset: Int;
//        var rOffset: Int;
//        
//        switch direction {
//            case .Up:
//                qOffset = 0
//                rOffset = -1
//            case .RightUp:
//                qOffset = +1
//                rOffset = -1
//            case .RightDown:
//                qOffset = +1
//                rOffset = 0
//            case .Down:
//                qOffset = 0
//                rOffset = +1
//            case .LeftDown:
//                qOffset = -1
//                rOffset = +1
//            case .LeftUp:
//                qOffset = -1
//                rOffset = 0
//            default:
//                (qOffset, rOffset) = super.offsetForDirection(direction)
//        }
//        
//        return (qOffset, rOffset)
//    }
//    
//    override public func directionFromOffset(qOffset: Int, rOffset: Int) -> HexaDirection {
//        var direction: HexaDirection
//        
//        switch (qOffset, rOffset) {
//            case (0, -1):
//                direction = .Up
//            case (+1, -1):
//                direction = .RightUp
//            case (+1, 0):
//                direction = .RightDown
//            case (0, +1):
//                direction = .Down
//            case (-1, +1):
//                direction = .LeftDown
//            case (-1, 0):
//                direction = .LeftUp
//            default:
//                direction = super.directionFromOffset(qOffset, rOffset: rOffset)
//        }
//        
//        return direction
//    }
//}