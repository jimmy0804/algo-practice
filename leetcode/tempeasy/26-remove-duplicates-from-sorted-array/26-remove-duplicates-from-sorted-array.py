
# 26. Remove Duplicates from Sorted Array
#
# Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.
# Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
#
# Time complexity: O(N), Space complexity: O(1)
def removeDuplicates(self, nums: List[int]) -> int:
    if len(nums) < 2:
        return len(nums)

    start = 0
    end = 1
    
    while end < len(nums):
        if nums[start] < nums[end]:
            start += 1
            nums[start] = nums[end]
        end += 1

    return start + 1
