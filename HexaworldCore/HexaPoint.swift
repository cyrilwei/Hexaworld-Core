//
//  HexaPoint.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 8/26/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

let HEXA_HASH_Q_SHIFT = 16
let HEXA_MAX_MAP_SIZE = 1 << HEXA_HASH_Q_SHIFT - 1

public struct HexaPoint {
    var q: Int = 0
    var r: Int = 0
    
    public var x: Int {
        return q
    }
    
    public var z: Int {
        return r
    }
    
    public var y: Int {
        return 0 - q - r
    }

    public init (q: Int, r: Int) {
        self.q = q
        self.r = r
    }

    public init (cube: (Int, Int, Int)) {
        let (x, _, z) = cube
        self.init(q: x, r: z)
    }

    public init (axial: (Int, Int)) {
        let (x, z) = axial
        self.init(q: x, r: z)
    }

    public func toAxial() -> (Int, Int) {
        return (q, r)
    }
}

extension HexaPoint: CustomStringConvertible {
    public var description: String {
        return "HexaPoint -> x:\(self.q), y:\(-self.q - self.r), z:\(self.r)"
    }
}

extension HexaPoint: Hashable {
    public var hashValue: Int {
        return q << HEXA_HASH_Q_SHIFT + r
    }
}

public func ==(lhs: HexaPoint, rhs: HexaPoint) -> Bool {
    return lhs.hashValue == rhs.hashValue
}