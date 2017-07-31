//
//  OrderedDict.swift
//  swift-structs
//
//  Created by Saburo Okita on 31.07.17.
//  Copyright © 2017 Saburo Okita. All rights reserved.
//

import Foundation

/**
 * @brief   OrderedDict is dictionary that preserves the initial key insertion order, i.e.
 *          it will remember the first time the key has been inserted
 *
 * @details Sample Usage:
 *          ```
 *          var ordered_dict: OrderedDict<Int, String> = [
 *              3: "value 3",
 *              0: "value 0",
 *              1: "value 1",
 *              2: "value 2",
 *          ]
 *          ```
 */
struct OrderedDict<K: Hashable, V>: ExpressibleByDictionaryLiteral, IteratorProtocol, Sequence {
    var index   : Int = 0
    var keys    : Array<K> = []
    var values  : Dictionary<K, V> = [:]
    
    /**
     * @brief   Initialize with nothing
     */
    init() {}
    
    /**
     * @brief   Initialize with dictionary literals
     * @param   elements key-value mapping ala initialization using dictionary literals
     */
    init(dictionaryLiteral elements: (K, V)...) {
        for element in elements {
            if values.updateValue(element.1, forKey: element.0) == nil {
                keys.append( element.0 )
            }
        }
    }
    
    /**
     * @brief   Get the number of elements
     * @returns the number of elements
     */
    var count: Int {
        return self.keys.count
    }
    
    /**
     * @brief   Get the description of the OrderedDict
     * @returns the description in String format
     */
    var description: String {
        var result = "{\n"
        
        for key in keys {
            result += "\t\(key) : \(String(describing: values[key]))\n"
        }
        
        result += "}"
        return result
    }
    
    /**
     * @brief   Remove the given key-value from the dictionary
     * @param   key the key to be removed
     */
    mutating func removeValue( forKey key: K ){
        values.removeValue(forKey: key)
        keys.remove(at: keys.index(of: key)!)
    }
    
    // MARK: Iterator
    /**
     * @brief       return the next element from iterator
     * @returns     returns the key-value tuple used while iterating this dictionary
     */
    mutating func next() -> (K, V?)? {
        guard index < count else {
            return nil
        }
        
        let next = keys[index]
        index += 1
        return (next, values[next]) as (K, V?)
    }
    
    
    // Mark: Subscript
    /**
     * @brief   Array / Dict subscription implementation
     */
    subscript(key: K) -> V? {
        get {
            return self.values[key]
        }
        
        set( new_value ) {
            if new_value == nil {
                self.values.removeValue(forKey: key)
                self.keys = self.keys.filter{ $0 != key }
            }
            else {
                if values.updateValue(new_value!, forKey: key) == nil {
                    keys.append( key )
                }
            }
        }
    }

}
