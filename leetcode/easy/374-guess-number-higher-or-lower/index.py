# 374. Guess Number Higher or Lower

# We are playing the Guess Game. The game is as follows:
# I pick a number from 1 to n. You have to guess which number I picked.
# Every time you guess wrong, I'll tell you whether the number is higher or lower.
# You call a pre-defined API guess(int num) which returns 3 possible results (-1, 1, or 0):



# The guess API is already defined for you.
# @param num, your guess
# @return -1 if my number is lower, 1 if my number is higher, otherwise return 0
# def guess(num: int) -> int:

class Solution:
    # Time complexity: O(logn) Space complexity: O(1)
    def guessNumber(self, n: int) -> int:
        left = 1
        right = n
        
        while left <= n:
            mid = (left + right) // 2
            guessed = guess(mid)
            if guessed == 0:
                return mid
            
            if guessed == 1:
                left = mid + 1
            else:
                right = mid - 1
        
        return 1
                
