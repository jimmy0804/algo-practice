# 129. Sum Root to Leaf Numbers
# Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.

# An example is the root-to-leaf path 1->2->3 which represents the number 123.
# Find the total sum of all root-to-leaf numbers.
# Note: A leaf is a node with no children.


# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def sumNumbers(self, root: TreeNode) -> int:
        # return self.dfs(root, 0)
        return self.bfs(root)
    
    # Time complexity: O(n), Space complexity: O(d)
    def dfs(self, root: TreeNode, sum: int) -> int:
        if not root:
            return 0
        newSum = sum * 10 + root.val
        
        isLeaf = not root.left and not root.right
        if isLeaf:
            return newSum
        
        return self.findLeafSum(root.left, newSum) + self.findLeafSum(root.right, newSum)
    
    # Time complexity: O(n), Space complexity: O(n)
    def bfs(self, root: TreeNode) -> int:
        if not root:
            return 0
        allSum = 0
        queue = [(root, 0)]
        
        while queue:
            node, sum = queue.pop()
            
            if not node.left and not node.right:
                allSum += sum * 10 + node.val
            
            if node.right:
                queue.insert(0, (node.right, sum * 10 + node.val))
            
            if node.left:
                queue.insert(0, (node.left, sum * 10 + node.val))
        
        return allSum
