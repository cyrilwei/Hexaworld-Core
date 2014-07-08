//
//  Hexaworld.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/6/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

class Hexaworld {
    let columns: Int
    let rows: Int
    
    var cells: [HexaworldCell?]
    
    subscript(column: Int, row: Int) -> HexaworldCell? {
        get {
            let index = cellIndex(column, row: row)
            if index == -1 {
                return nil
            }
            
            return cells[index]
        }
        set {
            let index = cellIndex(column, row: row)
            if index == -1 {
                return
            }
            
            cells[index] = newValue
        }
    }

    func cellIndex(column: Int, row: Int) -> Int {
        if column >= columns || column < 0 || row < 0 {
            return -1
        }
        
        if column % 2 == 0 && row >= rows {
            return -1
        }
        
        if column % 2 == 1 && row > rows {
            return -1
        }
        
        return column * rows + row + column / 2
    }

    init(columns: Int, rows: Int) {
        self.columns = columns;
        self.rows = rows;
        
        let cellCount = columns * rows + columns / 2
        cells = Array<HexaworldCell?>(count: cellCount, repeatedValue: nil)
        
        for i in 0..<cellCount {
            cells[i] = HexaworldCell()
        }
    }
}