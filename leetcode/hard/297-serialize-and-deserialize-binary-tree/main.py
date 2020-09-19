"""
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
"""

# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Codec:

    def serialize(self, root):
        """Encodes a tree t
      
        o a single string.
        
        :type root: TreeNode
        :rtype: str
        """
        return self.bfs(root)
        
    
    def bfs(self, root):
        if not root:
            return []
        
        # 1, 2
        queue = [root]
        serializedTree = []

        while queue:
            node = queue.pop(0)
            if not node:
                serializedTree.append(None)
                continue

            serializedTree.append(node.val)
            
            queue.append(node.left)
            queue.append(node.right)
        
        return serializedTree
        
        

    def deserialize(self, data):
        """Decodes your encoded data to tree.
        
        :type data: str
        :rtype: TreeNode
        """
        if not data:
            return None

        i = 0
        root = TreeNode(data[i])
        queue = [root]

        while queue:
            node = queue.pop(0)
            if i + 1 >= len(data):
                break
            
            i += 1
            if data[i] is not None:
                node.left = TreeNode(data[i])
                queue.append(node.left)
            
            if i + 1 >= len(data):
                break
            
            i += 1
            if data[i] is not None:
                node.right = TreeNode(data[i])
                queue.append(node.right)
            
        
        return root
        

# Your Codec object will be instantiated and called as such:
# codec = Codec()
# codec.deserialize(codec.serialize(root))


