//
//  Hexacube.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 8/26/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

let HEXA_HASH_X_SHIFT = 16
let HEXA_MAX_MAP_SIZE = 1 << HEXA_HASH_X_SHIFT - 1

public struct Hexacube {
    var x = 0
    var y = 0
    var z = 0

    public init (x: Int, y: Int, z:Int) {
        self.x = x
        self.y = y
        self.z = z
    }

    public init (cube: (Int, Int, Int)) {
        let (x, y, z) = cube
        self.init(x: x, y: y, z: z)
    }

    public init (axial: (Int, Int)) {
        let (x, z) = axial
        let y = -(x + z)
        self.init(x: x, y: y, z: z)
    }

    public func toAxial() -> (Int, Int) {
        return (x, z)
    }
}

extension Hexacube : Hashable {
    public var hashValue: Int {
        return x << HEXA_HASH_X_SHIFT + z
    }
}

public func ==(lhs: Hexacube, rhs: Hexacube) -> Bool {
    return lhs.hashValue == rhs.hashValue
}