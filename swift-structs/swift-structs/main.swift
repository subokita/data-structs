//
//  main.swift
//  swift-structs
//
//  Created by Saburo Okita on 31.07.17.
//  Copyright © 2017 Saburo Okita. All rights reserved.
//

import Foundation

var ordered_dict: OrderedDict<Int, String> = [
    3: "value 3",
    0: "value 0",
    1: "value 1",
    2: "value 2",
]

for (key, value) in ordered_dict {
    print("\(key) \(String(describing: value))")
}


var result = ordered_dict.map{ (key, value) in (key, value?.uppercased()) }
print( result )


ordered_dict.removeValue(forKey: 0)

print( ordered_dict.description )

