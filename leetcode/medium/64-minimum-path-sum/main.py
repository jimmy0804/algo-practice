"""
    64. Minimum Path Sum

    Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

    Note: You can only move either down or right at any point in time.
    
    Time complexity: O(n)
    Space complexity: O(n)
"""
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        return self.dfs(grid, (0,0), {})
    
    def dfs(self, grid, point, memo):
        row, col = point
        
        if row == len(grid) - 1 and col == len(grid[row]) - 1:
            return grid[row][col]
        
        if point in memo:
            return memo[point]
        
        minSum = float("inf")
        for pos in [(1,0), (0, 1)]:
            newRow = row + pos[0]
            newCol = col + pos[1]
            newPoint = (newRow, newCol)
            if newRow < 0 or newRow >= len(grid) or newCol < 0 or newCol >= len(grid[newRow]):
                continue

            sum = grid[row][col] + self.dfs(grid, newPoint, memo)
            minSum = min(sum, minSum)
        
        memo[point] = minSum
        return memo[point]
        
        
    
    
