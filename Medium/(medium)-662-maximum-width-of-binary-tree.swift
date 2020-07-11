/**
    Given a binary tree, write a function to get the maximum width of the given tree. The width of a tree is the maximum width among all levels. The binary tree has the same structure as a full binary tree, but some nodes are null.

    The width of one level is defined as the length between the end-nodes (the leftmost and right most non-null nodes in the level, where the null nodes between the end-nodes are also counted into the length calculation.
 */

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        return bfs(root)
    }
    
    /**
        Runtime: 40 ms, faster than 22.87% of Swift online submissions for Maximum Width of Binary Tree.
        Memory Usage: 21 MB, less than 92.31% of Swift online submissions for Maximum Width of Binary Tree.
     */
    private func bfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        var maxWidth = 1
        var queue = [(width: Int, node: TreeNode)]()
        queue.append((width: 1, node: root))
        
        while !queue.isEmpty {
            var hasTwoNodes = queue.count > 1
            if hasTwoNodes {
                let firstNode = queue.first!
                let lastNode = queue.last!
                maxWidth = max(maxWidth, lastNode.width - firstNode.width + 1)
            }
            
            for i in 0..<queue.count {
                var node = queue.removeFirst()
                if !hasTwoNodes {
                    node.width = 1
                }

                if let left = node.node.left {
                    queue.append((width: (node.width * 2) - 1, node: left))
                }
                
                if let right = node.node.right {
                    queue.append((width: node.width * 2, node: right))
                }
            }
        }
        
        return maxWidth
    }
}
