/**
 Given two binary trees, write a function to check if they are the same or not.

 Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        return preOrder(p, q)
        // return bfs(p, q)
    }
    
    // Runtime: 8 ms, faster than 69.76% of Swift online submissions for Same Tree.
    // Memory Usage: 21 MB, less than 17.21% of Swift online submissions for Same Tree.
    private func preOrder(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        
        if p == nil || q == nil {
            return false
        }

        if p?.val != q?.val {
            return false
        }
        
        return preOrder(p?.left, q?.left) && preOrder(p?.right, q?.right)
    }
    
    // Runtime: 12 ms, faster than 29.90% of Swift online submissions for Same Tree.
    // Memory Usage: 20.8 MB, less than 62.29% of Swift online submissions for Same Tree.
    private func bfs(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }

        if p?.val != q?.val {
            return false
        }
        
        var queueForP = [TreeNode?]()
        var queueForQ = [TreeNode?]()
        queueForP.append(p)
        queueForQ.append(q)
        
        while !queueForP.isEmpty || !queueForQ.isEmpty {
            let currentP = queueForP.removeFirst()
            let currentQ = queueForQ.removeFirst()
            
            if currentP == nil && currentQ == nil {
                continue
            }
            
            if currentP == nil || currentQ == nil {
                return false
            }
            
            if currentP?.val != currentQ?.val {
                return false
            }
            
            queueForP.append(currentP?.left)
            queueForQ.append(currentQ?.left)
            queueForP.append(currentP?.right)
            queueForQ.append(currentQ?.right)
        }
        
        return true
    }
}
