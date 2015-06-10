//
//  HexaCell.swift
//  Hexagems
//
//  Created by Cyril Wei on 10/11/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

public class HexaCell: CustomStringConvertible {
    public var point: HexaPoint!
    
    public init() {
    }

    public var description: String {
        return "HexaCell @ point -> x:\(self.point.q), y:\(-self.point.q - self.point.r), z:\(self.point.r)"
    }
}

extension HexaCell: Hashable {
    public var hashValue: Int {
        if let realPoint = point {
            return realPoint.hashValue
        }
            
        return Int.max
    }
}

public func ==(lhs: HexaCell, rhs: HexaCell) -> Bool {
    return lhs.hashValue == rhs.hashValue
}