//
//  OrderedDictTest.swift
//  swift-structs
//
//  Created by Saburo Okita on 31.07.17.
//  Copyright © 2017 Saburo Okita. All rights reserved.
//

import XCTest

class OrderedDictTest: XCTestCase {
    var orderedDict: OrderedDict<Int, String> = [:]
    
    override func setUp() {
        super.setUp()
        
        self.orderedDict = [
            3: "value 3",
            0: "value 0",
            1: "value 1",
            2: "value 2",
        ]
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testInit() {
        XCTAssertEqual( orderedDict.count, 4 )
        
        orderedDict = OrderedDict<Int, String>()
        XCTAssertNotNil( orderedDict)
        XCTAssertEqual( orderedDict.count, 0 )
    }
    
    func testEnumerate() {
        let expected_keys   = [3, 0, 1, 2]
        let expected_values = ["value 3", "value 0", "value 1", "value 2"]
        
        for (i, (key, value)) in orderedDict.enumerated() {
            XCTAssertEqual( expected_keys[i], key )
            XCTAssertEqual( expected_values[i], value )
        }
    }
    
    func testRemoveValue() {
        orderedDict[0] = nil
        XCTAssertNil(orderedDict[0])
        XCTAssertEqual(orderedDict.count, 3)
        
        orderedDict.removeValue(forKey: 2)
        XCTAssertNil(orderedDict[2])
        XCTAssertEqual(orderedDict.count, 2)
    }
}
