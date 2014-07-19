//
//  Hexaworld.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/6/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

let HEXA_HASH_SHIFT = 100

class Hexaworld {
    let columns: Int
    let rows: Int
    
    var cells = [Int: HexaworldCell]()
    
    let layout: HexaLayout
    
    func cellHashValue(column: Int, row: Int) -> Int {
        return row * HEXA_HASH_SHIFT + column
    }
    
    subscript(column: Int, row: Int) -> HexaworldCell? {
        get {
            let index = layout.cellIndex(column, row: row)
            if index == HEXA_NOT_FOUND {
                return nil
            }
            
            return cells[cellHashValue(column, row: row)]
        }
        set {
            let index = layout.cellIndex(column, row: row)
            if index == HEXA_NOT_FOUND {
                return
            }
            
            cells[cellHashValue(column, row: row)] = newValue
        }
    }
    
//    subscript(cell: HexaworldCell, direction: HexaworldDirection) -> HexaworldCell? {
//        let (columnOffset, rowOffset) = layout.offsetForDirection(direction)
//        
//        return self[cell.column + columnOffset, cell.row + rowOffset]
//    }

    init(layout: HexaLayout) {
        self.layout = layout
        
        columns = layout.columns;
        rows = layout.rows;

        fillCells()
    }
    
    func fillCells() {
        for col in 0..<columns {
            for row in 0...rows {
                let index = layout.cellIndex(col, row: row)
                
                if index == HEXA_NOT_FOUND {
                    continue
                }
                
                let cell = HexaworldCell(column: col, row: row)
                cells[cell.hashValue] = cell
            }
        }
    }
}