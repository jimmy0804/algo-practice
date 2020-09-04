"""
    79. Word Search
    Given a 2D board and a word, find if the word exists in the grid.

    The word can be constructed from letters of sequentially adjacent cell,
    where "adjacent" cells are those horizontally or vertically neighboring.
    The same letter cell may not be used more than once.
    
    Time complexity: O(n * 3 ^ d) where n is the number of cells in the board,
    and d is the depth of recursive call and 3 is because
    we have 3 ways to expand( branches) on each recursive call.
    
    Space complexity: O(n) worst case is all cells are need to form the word. Hence we have n depth.
"""
class Solution:
   
    def exist(self, board: List[List[str]], word: str) -> bool:
        if not board or not word:
            return False

        for i in range(len(board)):
            for j in range(len(board[i])):
                if board[i][j] == word[0]:
                    if self.backtrack(board, (i, j), word, 0, set()):
                        return True
        return False
    
    def backtrack(self, board, point, word, i, visited) -> bool:
        if i >= len(word):
            return False

        row, col = point
        if row < 0 or row >= len(board) or col < 0 or col >= len(board[row]):
            return False

        if word[i] != board[row][col]:
            return False
        
        if i == len(word) - 1 and board[row][col] == word[i]:
            return True

        for pos in [(0,1),(0,-1),(1,0),(-1,0)]:
            newPoint = (row + pos[0], col + pos[1])
            if newPoint in visited:
                continue
            
            visited.add(point)
            if self.backtrack(board, newPoint, word, i + 1, visited):
                return True
            visited.remove(point)
        
        return False
        
        
