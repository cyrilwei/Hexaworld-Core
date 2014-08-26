//
//  Hexacube.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 8/26/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

let HEXA_HASH_X_SHIFT = 16
let HEXA_HASH_Y_SHIFT = 8

public struct Hexacube {
    var x = 0
    var y = 0
    var z = 0

    public init (x: Int, y: Int, z:Int) {
        self.x = x
        self.y = y
        self.z = z
    }

    public init (v: (Int, Int, Int)) {
        let (x, y, z) = v
        self.init(x: x, y: y, z: z)
    }

    public init (v: (Int, Int)) {
        let (x, z) = v
        let y = -(x + z)
        self.init(x: x, y: y, z: z)
    }
}

extension Hexacube : Hashable {
    public var hashValue: Int {
        return x << HEXA_HASH_X_SHIFT + y << HEXA_HASH_Y_SHIFT + z
    }
}

public func ==(lhs: Hexacube, rhs: Hexacube) -> Bool {
    return lhs.hashValue == rhs.hashValue
}