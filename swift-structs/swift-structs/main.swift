//
//  main.swift
//  swift-structs
//
//  Created by Saburo Okita on 31.07.17.
//  Copyright © 2017 Saburo Okita. All rights reserved.
//

import Foundation

var tree_nodes = [
    TreeNode(index: 0, rank: 0),
    TreeNode(index: 1, rank: 0),
    TreeNode(index: 2, rank: 0),
]



DisjointSetForest.union(a: tree_nodes[0], b: tree_nodes[1])


for tree_node in tree_nodes {
    print( tree_node.description )
}
