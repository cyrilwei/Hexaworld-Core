//
//  Hexaworld+Swap.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/9/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

extension Hexaworld {
    func swap(cell: HexaworldCell, toDirection direction: HexaworldDirection) -> HexaworldCell? {
        if !cell.movable{
            return nil
        }
        
        let swappedCell = self[cell, direction]
        
        if let realSwappedCell = swappedCell? {
            if !realSwappedCell.movable{
                return nil
            }
            
            let originalColumn = cell.column
            let originalRow = cell.row
            
            let swappedToColumn = realSwappedCell.column
            let swappedToRow = realSwappedCell.row
            
            let originalCell = cell
            originalCell.column = swappedToColumn
            originalCell.row = swappedToRow
            
            realSwappedCell.column = originalColumn
            realSwappedCell.row = originalRow
            
            self[swappedToColumn, swappedToRow] = originalCell
            self[originalColumn, originalRow] = realSwappedCell
            
            return realSwappedCell
        }
        
        return nil
    }
    
    func canSwap(cell: HexaworldCell, toDirection direction: HexaworldDirection) -> Bool {
        if !cell.movable {
            return false
        }
        
        let targetCell = self[cell, direction]
        
        if let realTargetCell = targetCell? {
            return realTargetCell.movable
        }
        
        return false
    }
}