# 200. Number of Islands

# Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
class Solution:
    # Time complexity: O(n * m), Space complexity: O(1)
    def numIslands(self, grid: List[List[str]]) -> int:
        result = 0

        for row in range(0, len(grid)):
            for col in range(0, len(grid[row])):
                if grid[row][col] == "1":
                    self.checkIsIsland(grid, (row, col))
                    result += 1

        return result
        
    def checkIsIsland(self, grid, point):
        row, col = point

        # Boundary
        if row < 0 or row >= len(grid) or col < 0 or col >= len(grid[row]):
            return
        
        # Skip if we have visited or it's water
        if grid[row][col] != "1":
            return
        
        grid[row][col] = "#"
        
        self.checkIsIsland(grid, (row - 1, col))
        self.checkIsIsland(grid, (row, col - 1))
        self.checkIsIsland(grid, (row, col + 1))
        self.checkIsIsland(grid, (row + 1, col))
