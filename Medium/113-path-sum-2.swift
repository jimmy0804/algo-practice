/**
 * Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.
 *
 *  Runtime: 48 ms, faster than 26.17% of Swift online submissions for Path Sum II.
 *  Memory Usage: 21.5 MB, less than 94.44% of Swift online submissions for Path Sum II.
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
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        guard let root = root else { return [] }
        
        var result = [[Int]]()

        var stack = [(node: TreeNode, path: [Int], sum: Int)]()
        stack.append((node: root, path: [root.val], sum: root.val))
        
        while !stack.isEmpty {
            let current = stack.removeLast()
            let isLeaf = current.node.left == nil && current.node.right == nil
            
            if isLeaf, current.sum == sum {
                result.append(current.path)
                continue
            }
            
            if let right = current.node.right {
                let sum = current.sum + right.val

                var path = current.path
                path.append(right.val)
                
                stack.append((node: right, path: path, sum: sum))
            }
            
            if let left = current.node.left {
                let sum = current.sum + left.val

                var path = current.path
                path.append(left.val)
                
                stack.append((node: left, path: path, sum: sum))
            }
        }
        
        return result
    }
}
