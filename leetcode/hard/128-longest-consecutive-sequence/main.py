from typing import List
# 128. Longest Consecutive Sequence
# Given an unsorted array of integers, find the length of the longest consecutive elements sequence.

# Your algorithm should run in O(n) complexity.
class Solution:
    # Time complexity: O(n).
    # Space complexity: O(n + n)
    def longestConsecutive(self, nums: List[int]) -> int:
        numSet = set(nums)
        
        longest = 0
        used = {}
        for item in numSet:
            if item in used:
                continue

            leftCurrent = item - 1
            left = 0

            while leftCurrent in numSet:
                used[leftCurrent] = 1
                leftCurrent -= 1
                left += 1
            
            rightCurrent = item + 1
            right = 0

            while rightCurrent in numSet:
                used[rightCurrent] = 1
                rightCurrent += 1
                right += 1
            
            sum = left + right + 1
            longest = max(longest, sum)
            used[item] = 1

        return longest

print(Solution().longestConsecutive([100, 4, 200, 1, 3, 2]))
print(Solution().longestConsecutive([]))
print(Solution().longestConsecutive([1]))
print(Solution().longestConsecutive([1,2,7]))
