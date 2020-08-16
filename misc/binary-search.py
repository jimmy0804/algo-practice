
def search(self, nums: List[int], target: int) -> int:
    # return self.binarySearch(nums, target)
    return self.recursiveBinarySearch(nums, 0, len(nums) - 1, target)

# Time complexity: O(logn), Space complexity: O(1)
def binarySearch(self, nums: List[int], target: int) -> int:
    left = 0
    right = len(nums) - 1
    
    while left <= right:
        mid = (right + left) // 2
        if nums[mid] == target:
            return mid
        
        if nums[mid] > target:
            right = mid - 1
        else:
            left = mid + 1
    
    return -1

# Time complexity: O(logn), Space complexity: O(logn)
def recursiveBinarySearch(self, nums: List[int], left: int, right: int, target: int) -> int:
    if left > right:
        return -1
    
    mid = (right + left) // 2
    
    if nums[mid] == target:
        return mid
    
    if nums[mid] > target:
        return self.recursiveBinarySearch(nums, left, mid - 1, target)
    else:
        return self.recursiveBinarySearch(nums, mid + 1, right, target)
