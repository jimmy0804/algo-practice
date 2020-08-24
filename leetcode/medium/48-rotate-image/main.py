from typing import List
# 48. Rotate Image
# You are given an n x n 2D matrix representing an image.
# Rotate the image by 90 degrees (clockwise).

# Note:
# You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.
class Solution:
    
    def rotate(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        #.   0 1 2
        # 0 [1,2,3],     [7,8,9]     [7,4,1]
        # 1 [4,5,6], ->  [4,5,6]  -> [8,5,2]
        # 2 [7,8,9]      [1,2,3]     [9,6,3]
        matrix.reverse()
        
        for row in range(0, len(matrix)):
            for col in range(row + 1, len(matrix[row])):
                temp = matrix[row][col]
                matrix[row][col] = matrix[col][row]
                matrix[col][row] = temp
                
testCase1 = [
  [1,2,3],
  [4,5,6],
  [7,8,9]
]
Solution().rotate(testCase1)
print(testCase1)
