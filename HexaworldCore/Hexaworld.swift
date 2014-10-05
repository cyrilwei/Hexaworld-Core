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
    var cells: [HexaPoint: T]
    
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
            if isPointValid(column, z: row) {
                return cells[HexaPoint(axial: (column, row))]
            } else {
                return nil
            }
        }
        set {
            if isPointValid(column, z: row) {
                cells[HexaPoint(axial: (column, row))] = newValue
            }
        }
    }

    public subscript(point: HexaPoint?) -> T? {
        get {
            if isPointValid(point) {
                return cells[point!]
            } else {
                return nil
            }
        }
        set {
            if isPointValid(point) {
                cells[point!] = newValue
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
        
        let mapSize = radius * 2 + 1
        self.cells = Dictionary<HexaPoint, T>(minimumCapacity: mapSize * mapSize)
    }
    
    public func isPointValid(point: HexaPoint?) -> Bool {
        if let realPoint = point {
            return isPointValid(realPoint.q, z: realPoint.r)
        }
        
        return false
    }
    
    public func isPointValid(x: Int, z: Int) -> Bool {
        return ((abs(x) + abs(z) + abs(-x - z)) >> 1) <= radius
    }
    
    public func removeAll() {
        cells.removeAll(keepCapacity: true)
    }
    
    public func fill(fillBlock: (point: HexaPoint) -> T) {
        enumerateOrdered { (point) -> () in
            self[point] = fillBlock(point: point)
        }
    }
    
    public func enumerateCells(enumerateBlock: (point: HexaPoint, cell: T?) -> ()) {
        enumerateOrdered { (point) -> () in
            enumerateBlock(point: point, cell: self[point])
        }
    }
    
    func enumerateOrdered(enumerateBlock: (point: HexaPoint) -> ()) {
        for z in -radius...radius {
            for x in -radius...radius {
                if isPointValid(x, z: z) {
                    enumerateBlock(point: HexaPoint(axial: (x, z)))
                }
            }
        }
    }
}

extension Hexaworld: Printable {
    public var description: String {
        var str = ""

        enumerateOrdered { (point) -> () in
            if let cell = self[point] {
                str += "point: \(point), \(cell) "
            } else {
                str += "point: \(point), nil "
            }
        }
 
        return str
    }
}