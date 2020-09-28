/**
 110. Balanced Binary Tree
 
 Given a binary tree, determine if it is height-balanced.

 For this problem, a height-balanced binary tree is defined as:
 a binary tree in which the left and right subtrees of every node differ in height by no more than 1.
 
 Time complexity: O(n)
 Space complexity: O(d)
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
    var isBalanced = true
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        /*
                3
               /\
              1  5
             /
            2
           /
          4
        */
        
        dfs(root, 0)
        return isBalanced
    }
    
    private func dfs(_ root: TreeNode?, _ depth: Int) -> Int {
        guard let root = root else { return depth }
        
        let left = dfs(root.left, depth + 1)
        let right = dfs(root.right, depth + 1)
        
        if abs(left - right) > 1 {
            isBalanced = false
        }
        
        return max(left, right)
    }
}
