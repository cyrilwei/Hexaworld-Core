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
    var cells = [HexaPoint: T]()
    
    public let orientation: HexaOrientation
    
    public let radius: Int
    
    public var xFactor: CGFloat {
    get {
        return orientation.xFactor
    }
    }

    public var yFactor: CGFloat {
    get {
        return orientation.yFactor
    }
    }

    subscript(column: Int, row: Int) -> T? {
        get {
            return cells[HexaPoint(axial: (column, row))]
        }
        set {
            switch (column, row) {
                case (-radius...radius, -radius...radius):
                    cells[HexaPoint(axial: (column, row))] = newValue
                default:
                    return
            }
        }
    }

    public subscript(point: HexaPoint) -> T? {
        get {
            return cells[point]
        }
        set {
            switch (point.q, point.r) {
            case (-radius...radius, -radius...radius):
                cells[point] = newValue
            default:
                return
            }
        }
    }

    public subscript(point: HexaPoint, direction: HexaDirection) -> T? {
        let (deltaQ, deltaR) = orientation.offsetForDirection(direction)
        return self[point.q + deltaQ, point.r + deltaR]
    }
    
    public init(orientation: HexaOrientation, radius: Int) {
        self.orientation = orientation
        self.radius = radius
    }
    
    public func removeAll() {
        cells.removeAll(keepCapacity: true)
    }
    
    public func fill(fillBlock: (point: HexaPoint) -> T) {
        for x in -radius...radius {
            for z in -radius...radius {
                if abs(x + z) > radius {
                    continue
                }
                let point = HexaPoint(axial: (x, z))
                self[point] = fillBlock(point: point)
            }
        }
    }
    
    public func enumerate(enumerateBlock: (point: HexaPoint, object: T) -> ()) {
        for (point, object) in cells {
            enumerateBlock(point: point, object: object)
        }
    }
}