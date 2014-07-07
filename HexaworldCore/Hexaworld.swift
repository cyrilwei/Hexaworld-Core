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
    
    let cells: HexaworldCell?[]
    
    subscript(column: Int, row: Int) -> HexaworldCell? {
        get {
            if row >= rows || row < 0 || column >= columns || column < 0 {
                return nil
            }
            
            return cells[row * columns + column]
        }
        set {
            cells[row * columns + column] = newValue
        }
    }
    
    init(columns: Int, rows: Int) {
        self.columns = columns;
        self.rows = rows;
        
        cells = []
        
        for i in 0..(columns * rows) {
            cells.append(HexaworldCell())
        }
    }
}