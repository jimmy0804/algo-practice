/**
 Given a binary tree, flatten it to a linked list in-place.
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
    func flatten(_ root: TreeNode?) {
        guard let root = root else { return }

        // iterative(root)
        
        var tail = root
        recursive(root, &tail)
    }
    
    // Time complexity: O(n), Memory: O(n)
    private func iterative(_ root: TreeNode) {
        var stack = [TreeNode]()
        stack.append(root)
        
        while !stack.isEmpty {
            let node = stack.removeLast()
            
            if let right = node.right {
                stack.append(right)
            }
            
            if let left = node.left {
                stack.append(left)
            }
            
            if !stack.isEmpty {
                node.right = stack.last
            }
            
            node.left = nil
        }
    }
    
    // Time complexity: O(n), Memory: O(n)
    private func recursive(_ root: TreeNode?, _ tail: inout TreeNode) {
        guard let root = root else { return }

        let left = root.left
        let right = root.right

        if tail !== root {
            tail.right = root
            tail.left = nil
        }
        
        tail = root
        
        recursive(left, &tail)
        recursive(right, &tail)
    }
}
