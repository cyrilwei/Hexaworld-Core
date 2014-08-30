//
//  HexaworldTests.swift
//  HexaworldCore
//
//  Created by Cyril Wei on 8/28/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import UIKit
import XCTest
import HexaworldCore

class HexaworldTests: XCTestCase {
    let expectedRadius = 5
    
    var world = Hexaworld<Int>(orientation: HexaHorizontal(), radius: 0)
    
    override func setUp() {
        super.setUp()

        createAndFillWorldWithRadius(expectedRadius)
    }
    
    func createAndFillWorldWithRadius(radius: Int) {
        world = Hexaworld<Int>(orientation: HexaHorizontal(), radius: radius)
        
        world.fill { (x, y, z) -> Int in
            return x << 8 + z
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_can_create_radius_0_world() {
        createAndFillWorldWithRadius(0)
        
        XCTAssertEqual(0, world[0, 0]!)
        XCTAssertNil(world[0, 1])
    }
    
    func test_should_return_correct_cell() {
        let cell = world[1, 1]
        
        XCTAssertEqual(1 << 8 + 1, cell!)
    }
    
    func test_should_return_nil_if_index_out_of_boundary() {
        let cell = world[expectedRadius + 1, expectedRadius]
        
        XCTAssertNil(cell)
    }
    
    func test_should_return_correct_cell_for_neighbor_RIGHT() {
        let neighborCell = world[0, 0, .Right]

        XCTAssertEqual(1 << 8 + 0, neighborCell!)
    }
}
