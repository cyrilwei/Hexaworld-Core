//
//  HexaOrientation.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/13/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

class HexaOrientation {
    func offsetForDirection(direction: HexaDirection) -> (Int, Int) {
        return (Int.max, Int.max)
    }
    
    func directionFromOffset(columnOffset: Int, rowOffset: Int) -> HexaDirection {
        return .Unsupported
    }
}