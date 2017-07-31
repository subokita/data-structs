//
//  DisjointSetForest.swift
//  swift-structs
//
//  Created by Saburo Okita on 31.07.17.
//  Copyright © 2017 Saburo Okita. All rights reserved.
//

import Foundation


class TreeNode {
    var index       : Int           = 0
    var rank        : Int           = 0
    weak var parent : TreeNode?
    var children    : [TreeNode]    = []
    
    init( index: Int = 0, rank: Int = 0, parent: TreeNode? = nil, children: [TreeNode]? = nil ) {
        self.index      = index
        self.rank       = rank
        self.parent     = parent == nil ? self : parent
        self.children   = children == nil ? [] : children!
    }
    
    var description: String {
        return
            "index      : \(index)\n" +
            "rank       : \(rank)\n" +
            "parent     : \(String(describing: parent?.index))\n" +
            "children   : \(children)\n"
    }
}

class DisjointSetForest {
    class func find( node: TreeNode ) -> TreeNode {
        if node.parent!.index == node.index {
            return node
        }
        
        node.parent = DisjointSetForest.find(node: node.parent!)
        return node.parent!
    }
    
    class func union( a: TreeNode, b: TreeNode ) {
        let root_a = DisjointSetForest.find( node: a )
        let root_b = DisjointSetForest.find( node: b )
        
        if root_a.rank < root_b.rank {
            root_a.parent = root_b
        }
        else {
            root_b.parent = root_a
            root_a.rank += 1
        }
    }
}
