//
//  HexaLayout+Factory.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/11/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

extension HexaLayout {
    class func createLandscapeLayout(columns: Int, rows: Int) -> HexaLayout {
        return HexaRectLayout(columns: columns, rows: rows)
    }
}