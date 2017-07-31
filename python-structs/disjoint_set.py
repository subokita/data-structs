'''
Based on https://en.wikipedia.org/wiki/Disjoint-set_data_structure
'''


class TreeNode( object ):
    """
    @brief represents each individual tree node
    """

    def __init__( self, index = 0., rank = 0, parent = None, children = None ):
        self.index    = index
        self.rank     = rank
        self.parent   = self if parent is None else parent
        self.children = [] if children is None else children


    def __str__( self ):
        return '''
        index   : {index}
        rank    : {rank}
        parent  : {parent}
        children: {children}
        '''.format( index = self.index, rank = self.rank, parent = self.parent.index, children = self.children )


class DisjointSetForest( object ):
    """
    @brief Mostly functions to construct disjoint set forest
    """

    @classmethod
    def find( cls, node: TreeNode ) -> TreeNode:
        """
        @brief      find the root of the given tree node
        @param      node the node whose root ancestor we are looking for 
        @returns    If node is already the root, returns the node itself, else find the root recursively
        """
        if node.parent == node:
            return node
        else:
            node.parent = cls.find( node.parent )
            return node.parent

    @classmethod
    def union( cls, a: TreeNode, b: TreeNode ) -> None:
        """
        @brief  Given two  nodes, try to union them together as part of the forst
        @param  a first tree node 
        @param  b second tree node
        """
        root_a = cls.find( a )
        root_b = cls.find( b )

        if root_a.rank < root_b.rank:
            root_a.parent = root_b
        else:
            root_b.parent = root_a
            root_a.rank += 1


def main():
    tree_nodes = [TreeNode( i ) for i in range(4)]
    DisjointSetForest.union( tree_nodes[0], tree_nodes[1] )
    DisjointSetForest.union( tree_nodes[1], tree_nodes[2] )
    print( tree_nodes[0] )
    print( tree_nodes[1] )
    print( tree_nodes[2] )

    print('[DONE]')

if __name__ == '__main__':
    main()