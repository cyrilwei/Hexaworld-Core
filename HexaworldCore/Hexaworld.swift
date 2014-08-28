//
//  Hexaworld.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/6/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation
import CoreGraphics

public class Hexaworld <T> {
    public let columns: Int
    public let rows: Int
    
    public var cells = [Hexacube: T]()
    
    public let layout: HexaLayout
    
    public var xFactor: CGFloat {
    get {
        return layout.orientation.xFactor
    }
    }

    public var yFactor: CGFloat {
    get {
        return layout.orientation.yFactor
    }
    }

    public subscript(column: Int, row: Int) -> T? {
        get {
            return cells[Hexacube(axial: (column, row))]
        }
        set {
            cells[Hexacube(axial: (column, row))] = newValue
        }
    }
    
    public init(layout: HexaLayout) {
        self.layout = layout
        
        columns = layout.columns;
        rows = layout.rows;
    }
    
    public func fill(fillBlock: (x: Int, y: Int, z: Int) -> T) {
        for x in 0..<columns {
            for z in 0..<rows {
                self[x, z] = fillBlock(x: x, y: -(x + z), z: z)
            }
        }
    }    
}