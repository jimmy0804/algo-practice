from typing import List

# 34. Find First and Last Position of Element in Sorted Array

class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        # 0 1 2 3 4 5
        # 5 7 7 8 8 10
        # ^     ^    ^
        if not nums:
            return [-1, -1]
        
        return [self.findFirstPosition(nums, target), self.findLastPosition(nums, target)]

    # Find the left index boundary that matches the start of a possible series of target numbers
    # Time complexity: O(logn), Space complexity: O(1)
    def findFirstPosition(self, nums: List[int], target: int) -> int:
        left = 0
        right = len(nums) - 1
        
        while left < right:
            mid = (left + right) // 2
            
            if nums[mid] < target:
                left = mid + 1
            else:
                right = mid
        
        if nums[left] == target:
            return left
        else:
            return -1

    # Find the right index boundary that matches the end of a possible series of target numbers
    # Time complexity: O(logn), Space complexity: O(1)
    def findLastPosition(self, nums: List[int], target: int) -> int:
        left = 0
        right = len(nums)
        
        while left < right:
            mid = (left + right) // 2
            
            if nums[mid] > target:
                right = mid
            else:
                left = mid + 1
        
        if nums[left - 1] == target:
            return left - 1
        else:
            return -1

print(Solution().searchRange([5,7,7,8,8,10], 8))
print(Solution().searchRange([5,7,7,8,8,10], 5))
print(Solution().searchRange([5,7,7,8,10,10], 10))
print(Solution().searchRange([1], 1))
print(Solution().searchRange([], 8))
