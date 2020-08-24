# 404. Sum of Left Leaves

# Find the sum of all left leaves in a given binary tree.

# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def sumOfLeftLeaves(self, root: TreeNode) -> int:
        # return self.dfs(root, False)
        return self.bfs(root)
    
    # Time complexity: O(n), Space complexity: O(2^depth)
    def bfs(self, root: TreeNode) -> int:
        if not root: return 0

        queue = []
        queue.append((root, False))
        total = 0
        
        while queue:
            node = queue.pop()
            
            isLeaf = not node[0].left and not node[0].right
            
            if isLeaf and node[1]:
                total += node[0].val
            
            if node[0].left:
                queue.insert(0, (node[0].left, True))
            
            if node[0].right:
                queue.insert(0, (node[0].right, False))
        
        return total
            
        # Time complexity: O(n), Space complexity: O(n)
    def dfs(self, root: TreeNode, isLeft: bool) -> int:
        if not root:
            return 0

        isLeaf = not root.left and not root.right
        if isLeaf and isLeft:
            return root.val
        
        return self.dfs(root.left, True) + self.dfs(root.right, False)
    
