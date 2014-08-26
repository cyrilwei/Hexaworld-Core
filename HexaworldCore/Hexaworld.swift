//
//  Hexaworld.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/6/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

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
            let index = layout.cellIndex(column, row: row)
            if index == HEXA_NOT_FOUND {
                return nil
            }
            
            return cells[Hexacube(v: (column, row))]
        }
        set {
            let index = layout.cellIndex(column, row: row)
            if index == HEXA_NOT_FOUND {
                return
            }
            
            cells[Hexacube(v: (column, row))] = newValue
        }
    }
    
//    subscript(cell: HexaCell, direction: HexaworldDirection) -> HexaCell? {
//        let (columnOffset, rowOffset) = layout.offsetForDirection(direction)
//        
//        return self[cell.column + columnOffset, cell.row + rowOffset]
//    }

    public init(layout: HexaLayout) {
        self.layout = layout
        
        columns = layout.columns;
        rows = layout.rows;
    }
    
//    public func fillCells() {
//        for col in 0..<columns {
//            for row in 0...rows {
//                let index = layout.cellIndex(col, row: row)
//                
//                if index == HEXA_NOT_FOUND {
//                    continue
//                }
//                
//                let cell = T()
//                cells[Hexacube(v: (col, row))] = cell
//            }
//        }
//    }
}