//
//  HexaDirection.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 7/15/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation

public enum HexaDirection: Int {
    case Unsupported = 0
    case Up
    case RightUp
    case Right
    case RightDown
    case Down
    case LeftDown
    case Left
    case LeftUp
    
    public var name: String {
        let directionNames = [
            "Unsupported",
            "Up",
            "RightUp",
            "Right",
            "RightDown",
            "Down",
            "LeftDown",
            "Left",
            "LeftUp"]
            
        return directionNames[self.rawValue]
    }
}