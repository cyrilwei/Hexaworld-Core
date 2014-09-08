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
    var q = 0
    var r = 0

    public init (q: Int, r: Int) {
        self.q = q
        self.r = r
    }

    public init (cube: (Int, Int, Int)) {
        let (x, y, z) = cube
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

extension HexaPoint: Printable {
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