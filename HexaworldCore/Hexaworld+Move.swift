//
//  Hexaworld+Move.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/21/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

extension Hexaworld {
    func fillHoles(direction: HexaDirection) {
        let (columnOffset, rowOffset) = layout.offsetForDirection(direction)
        
        for column in 0...columns {
            for row in 0...rows {
                if layout.cellIndex(column, row: row) != HEXA_NOT_FOUND {
                    if cells[cellHashValue(column, row: row)] == nil {
                        for lookup in (row + 1)...rows {
                            if let cell = cells[cellHashValue(column, row: lookup)] {
                                cells[cellHashValue(column, row: lookup)] = nil
                                cells[cellHashValue(column, row: row)] = cell
                                cell.row = row

                                break
                            }
                        }
                    }
                }
            }
        }
    }
}