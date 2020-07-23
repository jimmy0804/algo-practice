/**
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        // return recusively(left: root.left, right: root.right)
        return iterativly(root: root)
    }
    
    func recusively(left: TreeNode?, right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        
        if left?.val != right?.val {
            return false
        }
        
        return recusively(left: left?.left, right: right?.right) && recusively(left: left?.right, right: right?.left)
    }
    
    func iterativly(root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        var queue = [(first: TreeNode?, second: TreeNode?)]()
        queue.append((first: root.left, second: root.right))
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            
            if current.first == nil && current.second == nil {
                continue
            }
            
            if current.first?.val != current.second?.val {
                return false
            }
            
            queue.append((first: current.first?.left, second: current.second?.right))
            queue.append((first: current.first?.right, second: current.second?.left))
        }
        
        return true
    }
}
