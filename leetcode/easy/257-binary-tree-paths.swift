/**
 Given a binary tree, return all root-to-leaf paths.
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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        // return dfs(root, "")
        return iterative(root)
    }
    
    // Time complexity: O(n), Memory: O(n)
    private func iterative(_ root: TreeNode?) -> [String] {
        guard let root = root else { return [] }
        
        var result = [String]()
        var stack = [(node: TreeNode, path: String)]()
        stack.append((node: root, path: "\(root.val)"))
        
        while !stack.isEmpty {
            let current = stack.removeLast()
            
            if current.node.left == nil && current.node.right == nil {
                result.append(current.path)
                continue
            }
            
            if let right = current.node.right {
                stack.append((node: right, path: "\(current.path)->\(right.val)"))
            }
            
            if let left = current.node.left {
                stack.append((node: left, path: "\(current.path)->\(left.val)"))
            }
        }
        
        return result
    }
    
    // Time complexity: O(n), Memory: O(n)
    private func dfs(_ root: TreeNode?, _ path: String) -> [String] {
        guard let root = root else { return [] }
        
        var newPath = path
        if !newPath.isEmpty {
            newPath += "->"
        }
        newPath += "\(root.val)"

        if root.left == nil && root.right == nil {
            return [newPath]
        }
        
        return [] + dfs(root.left, newPath) + dfs(root.right, newPath)
    }
}
