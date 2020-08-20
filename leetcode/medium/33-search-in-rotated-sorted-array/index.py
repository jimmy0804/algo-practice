# 33. Search in Rotated Sorted Array

# Time complexity: O(logn + logn), Space complexity: O(1)
def search(self, nums: List[int], target: int) -> int:
    pivotIndex = self.findPivotIndex(nums)

    left = 0
    right = len(nums) - 1

    if target >= nums[pivotIndex] and target <= nums[right]:
        left = pivotIndex
    else:
        right = pivotIndex - 1
        
    while left <= right:
        mid = left + (right - left) // 2
        
        if nums[mid] == target:
            return mid
        
        if nums[mid] > target:
            right = mid - 1
        else:
            left = mid + 1
    
    return -1

# Time complexity: O(logn), Space complexity: O(1)
def findPivotIndex(self, nums: List[int]) -> int:
    left = 0
    right = len(nums) - 1
    
    while left < right:
        mid = left + (right - left) // 2
        
        if nums[mid] > nums[right]:
            left = mid + 1
        else:
            right = mid
    return left
        
    
            
    
    
