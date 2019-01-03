//
//  Hexaworld.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/6/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation
import CoreGraphics

public class Hexaworld <T: HexaCell> {
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
            if isPointValid(x: column, z: row) {
                return cells[HexaPoint(axial: (column, row))]
            } else {
                return nil
            }
        }
        set {
            if isPointValid(x: column, z: row) {
                let point = HexaPoint(axial: (column, row))
                newValue?.point = point
                cells[point] = newValue
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
                newValue?.point = point!
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
    
    public func isPointValid(_ point: HexaPoint?) -> Bool {
        if let realPoint = point {
            return isPointValid(x: realPoint.q, z: realPoint.r)
        }
        
        return false
    }
    
    public func isPointValid(x: Int, z: Int) -> Bool {
        let distance: Int = (Int(abs(x)) + Int(abs(z)) + Int(abs(-x - z))) >> 1
        return distance <= radius
    }
    
    public func removeAll() {
        cells.removeAll(keepingCapacity: true)
    }
    
    public func fill(fillBlock: (HexaPoint) -> T?) {
        enumerateOrdered { (point) -> () in
            self[point] = fillBlock(point)
        }
    }
    
    public func enumerateCells(enumerateBlock: (HexaPoint, _ cell: T?) -> ()) {
        enumerateOrdered { (point) -> () in
            enumerateBlock(point, self[point])
        }
    }
    
    func enumerateOrdered(enumerateBlock: (HexaPoint) -> ()) {
        for z in -radius...radius {
            for x in -radius...radius {
                if isPointValid(x: x, z: z) {
                    enumerateBlock(HexaPoint(axial: (x, z)))
                }
            }
        }
    }

    func nearByPointsForPoint(_ point: HexaPoint) -> [HexaPoint] {
        var nearPoints = [HexaPoint]()

        self.orientation.enumerateSupported { (direction) -> () in
            if let nearPoint = self.orientation.pointFromPoint(point, direction: direction) {
                nearPoints.append(nearPoint)
            }
        }

        return nearPoints
    }
}

extension Hexaworld: CustomStringConvertible {
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
