/*
 Given a binary tree, determine if it is a valid binary search tree (BST).

 Assume a BST is defined as follows:

 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
 
 Time complexity: O(n), Space complexity: O (n)
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        return validBST(root, Int.max, Int.min)
    }
    
    private func validBST(_ root: TreeNode?, _ upper: Int, _ lower: Int) -> Bool {
        guard let root = root else { return true }
        
        var isCurrentValid = root.val < upper && root.val > lower
        let isLeftValid = validBST(root.left, root.val, lower)
        let isRightValid = validBST(root.right, upper, root.val)
        
        return isCurrentValid && isLeftValid && isRightValid
    }
}
