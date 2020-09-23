/**
    510. Inorder Successor in BST II
 
    Given a node in a binary search tree, find the in-order successor of that node in the BST.

    If that node has no in-order successor, return null.

    The successor of a node is the node with the smallest key greater than node.val.
 
    Time complexity: O(d) where d is the max depth
    Space complexity: O(1)
 */

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var parent: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.parent = nil
    }
}

extension Node: Equatable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.val == rhs.val
    }
}

class Solution {
    func inorderSuccessor(_ node: Node?) -> Node? {
        if let rightLeftMostNode = findRightLeftMostNode(node?.right) {
            return rightLeftMostNode
        }
        
        return findLeftParent(node)
    }
    
    private func findRightLeftMostNode(_ node: Node?) -> Node? {
        guard node != nil else { return nil }

        var cur = node
        while cur != nil {
            if cur?.left == nil { return cur }
            cur = cur?.left
        }
        
        return nil
    }
    
    private func findLeftParent(_ node: Node?) -> Node? {
        guard node != nil else { return nil }
        var cur = node

        while cur?.parent != nil {
            if cur?.parent?.left == cur {
                return cur?.parent
            }
        
            cur = cur?.parent
        }
        
        return nil
    }
}
