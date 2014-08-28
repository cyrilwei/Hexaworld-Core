//
//  Hexaworld+Fill.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 8/28/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

extension Hexaworld {
    public func fill(block: (x: Int, y: Int, z: Int) -> T) {
        for x in 0..<columns {
            for z in 0..<rows {
                let result = block(x: x, y: -(x + z), z: z)
                self.cells[Hexacube(axial: (x, z))] = result
            }
        }
    }
}