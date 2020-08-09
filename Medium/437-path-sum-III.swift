/**
 You are given a binary tree in which each node contains an integer value.

 Find the number of paths that sum to a given value.

 The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).

 The tree has no more than 1,000 nodes and the values are in the range -1,000,000 to 1,000,000.
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

// Time complexity: O(n^2), Space complexity: O(n) recursive calls
class Solution {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }

        return helper(root, sum) + pathSum(root.left, sum) + pathSum(root.right, sum)
    }
    
    private func helper(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        
        let isHit = root.val == sum ? 1 : 0

        return isHit + helper(root.left, sum - root.val) + helper(root.right, sum - root.val)
    }
}
