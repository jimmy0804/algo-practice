/**
    129. Sum Root to Leaf Numbers

    Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.
    An example is the root-to-leaf path 1->2->3 which represents the number 123.
    Find the total sum of all root-to-leaf numbers.

    Note: A leaf is a node with no children.
        
    Time complexity: O(n)
    Space complexity: O(n)
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
    func sumNumbers(_ root: TreeNode?) -> Int {
        var result = 0
        dfs(root, 0, &result)
        return result
    }
    
    private func dfs(_ root: TreeNode?, _ current: Int, _ result: inout Int) {
        guard let root = root else { return }
        
        let newCurrent = current * 10 + root.val

        let isLeaf = root.left == nil && root.right == nil
        if isLeaf {
            
            result += newCurrent
            return
        }
        
        dfs(root.left, newCurrent, &result)
        dfs(root.right, newCurrent, &result)
    }
}
