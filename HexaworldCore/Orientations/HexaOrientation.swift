//
//  HexaOrientation.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/13/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation
import CoreGraphics

let M_2_COS_PI_6 = CGFloat(2.0 * cos(M_PI / 6))

class HexaOrientation {
    let xFactor: CGFloat
    let yFactor: CGFloat
    
    init(xFactor: CGFloat, yFactor: CGFloat) {
        self.xFactor = xFactor
        self.yFactor = yFactor
    }
    
    func offsetForDirection(direction: HexaDirection) -> (Int, Int) {
        return (Int.max, Int.max)
    }
    
    func directionFromOffset(columnOffset: Int, rowOffset: Int) -> HexaDirection {
        return .Unsupported
    }
}