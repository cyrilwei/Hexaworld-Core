//
//  HexaOrientation.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/13/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation
import CoreGraphics

let M_2_COS_PI_6 = CGFloat(2.0 * cos(.pi / 6))

public class HexaOrientation {
    let xFactor: CGFloat
    let yFactor: CGFloat
    
    init(xFactor: CGFloat, yFactor: CGFloat) {
        self.xFactor = xFactor
        self.yFactor = yFactor
    }
    
    public func offsetForDirection(_ direction: HexaDirection) -> (Int, Int) {
        return (Int.max, Int.max)
    }
    
    public func directionFromOffset(_ qOffset: Int, rOffset: Int) -> HexaDirection {
        return .Unsupported
    }
    
    public func directionFromDegree(_ degree: Int) -> HexaDirection {
        return .Unsupported
    }
    
    public func pointFromPoint(_ point: HexaPoint?, direction: HexaDirection) -> HexaPoint? {
        return nil
    }

    public func enumerateSupported(_ enumerateBlock: (HexaDirection) -> () ) {
        for dir in 1...8 {
            if let direction = HexaDirection(rawValue: dir) {
                enumerateBlock(direction)
            }
        }
    }
}
