//
//  Hexaworld.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/6/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

class Hexaworld {
    var width: Int
    var height: Int
    
//    var cells: HexaworldCell[]
    
    var cellCount: Int {
    get {
        return width * height
    }
    }
    
    init(width: Int, height: Int) {
        self.width = width;
        self.height = height;
        
        
    }
}