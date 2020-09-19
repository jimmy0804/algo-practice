/**
    297. Serialize and Deserialize Binary Tree

    Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, 
    or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

    Design an algorithm to serialize and deserialize a binary tree. 
    There is no restriction on how your serialization/deserialization algorithm should work. 
    You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

    Clarification: The input/output format is the same as how LeetCode serializes a binary tree. 
    You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.

    Time complexity: O(n)
    Space complexity: O(n)
*/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var data = [String]()
        dfs(root, &data)
        return data.joined(separator: ",")
    }
    
    private func dfs(_ root: TreeNode?, _ data: inout [String]){
        guard let root = root else {
            data.append("#")
            return
        }
        
        data.append("\(root.val)")
        
        dfs(root.left, &data)
        dfs(root.right, &data)
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        let items = data.components(separatedBy: ",")
        guard
            items.count > 0,
            items[0] != "#"
            else { return nil }

        var index = 0
        var root = TreeNode(Int(items[index])!)
        
        decode(items, &index, root)
        
        return root
    }
    
    private func decode(_ items: [String], _ index: inout Int, _ root: TreeNode?) {
        if index + 1 >= items.count {
            return
        }
        
        index += 1
        if items[index] != "#" {
            root?.left = TreeNode(Int(items[index])!)
            decode(items, &index, root?.left)
        }
        
        
        if index + 1 >= items.count {
            return
        }
        
        index += 1
        if items[index] != "#" {
            root?.right = TreeNode(Int(items[index])!)
            decode(items, &index, root?.right)
        }
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))
