//
//  HexaHorizontal.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/23/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

class HexaHorizontal: HexaOrientation {
    init() {
        super.init(xFactor: M_2_COS_PI_6, yFactor: 1.5)
    }
}