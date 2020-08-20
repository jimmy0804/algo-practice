# 162. Find Peak Element
class Solution:

    # Time complexity: O(logn), Space complexity: O(1)
    def findPeakElement(self, nums: List[int]) -> int:
        left = 0
        right = len(nums) - 1
        
        while left < right:
            mid = (right + left) // 2
            
            if nums[mid] > nums[mid + 1]:
                right = mid
            else:
                left = mid + 1

        return left
        
                
