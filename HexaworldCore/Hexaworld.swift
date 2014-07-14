//
//  Hexaworld.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/6/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

enum HexaworldDirection {
    case Up
    case RightUp
    case Right
    case RightDown
    case Down
    case LeftDown
    case Left
    case LeftUp
}

class Hexaworld {
    
    let columns: Int
    let rows: Int
    
    var cells: [HexaworldCell!]
    
    let layout: HexaLayout
    
    subscript(column: Int, row: Int) -> HexaworldCell? {
        get {
            let index = layout.cellIndex(column, row: row)
            if index == HEXA_NOT_FOUND {
                return nil
            }
            
            return cells[index]
        }
        set {
            let index = layout.cellIndex(column, row: row)
            if index == HEXA_NOT_FOUND {
                return
            }
            
            cells[index] = newValue
        }
    }
    
    subscript(cell: HexaworldCell, direction: HexaworldDirection) -> HexaworldCell? {
        let (columnOffset, rowOffset) = layout.offsetForDirection(direction)
        
        return self[cell.column + columnOffset, cell.row + rowOffset]
    }


    init(layout: HexaLayout) {
        self.layout = layout
        
        columns = layout.columns;
        rows = layout.rows;
        
        let cellCount = columns * rows + columns / 2
        cells = Array<HexaworldCell!>(count: cellCount, repeatedValue: nil)

        fillCells()
    }
    
    func fillCells() {
        for col in 0..<columns {
            for row in 0...rows {
                let index = layout.cellIndex(col, row: row)
                
                if index == HEXA_NOT_FOUND {
                    continue
                }
                
                cells[index] = HexaworldCell(column: col, row: row)
            }
        }
    }
}