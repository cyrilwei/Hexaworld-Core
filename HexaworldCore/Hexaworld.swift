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
    case RightDown
    case Down
    case LeftDown
    case LeftUp
}

class Hexaworld {
    let notFound = -1
    
    let columns: Int
    let rows: Int
    
    var cells: [HexaworldCell?]
    
    subscript(column: Int, row: Int) -> HexaworldCell? {
        get {
            let index = cellIndex(column, row: row)
            if index == notFound {
                return nil
            }
            
            return cells[index]
        }
        set {
            let index = cellIndex(column, row: row)
            if index == notFound {
                return
            }
            
            cells[index] = newValue
        }
    }
    
    subscript(cell: HexaworldCell, direction: HexaworldDirection) -> HexaworldCell? {
        get {
            var deltaColumn: Int;
            var deltaRow: Int;
            
            switch direction {
            case .Up:
                deltaColumn = 0
                deltaRow = -1
            case .RightUp:
                deltaColumn = +1
                deltaRow = -1
            case .RightDown:
                deltaColumn = +1
                deltaRow = 0
            case .Down:
                deltaColumn = 0
                deltaRow = +1
            case .LeftDown:
                deltaColumn = -1
                deltaRow = 0
            case .LeftUp:
                deltaColumn = -1
                deltaRow = -1
            }
            
            return self[cell.column + deltaColumn, cell.row + deltaRow]
        }
    }

    func cellIndex(column: Int, row: Int) -> Int {
        if column >= columns || column < 0 || row < 0 {
            return notFound
        }
        
        if column % 2 == 0 && row >= rows {
            return notFound
        }
        
        if column % 2 == 1 && row > rows {
            return notFound
        }
        
        return column * rows + row + column / 2
    }

    init(columns: Int, rows: Int) {
        self.columns = columns;
        self.rows = rows;
        
        let cellCount = columns * rows + columns / 2
        cells = Array<HexaworldCell?>(count: cellCount, repeatedValue: nil)

        for col in 0..<columns {
            for row in 0...rows {
                let index = cellIndex(col, row: row)
                
                if index == notFound {
                    continue
                }
                
                cells[index] = HexaworldCell(column: col, row: row)
            }
        }
    }
}