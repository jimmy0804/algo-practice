
 /* 26. Remove Duplicates from Sorted Array

    Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.
    Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
 
    Time complexity: O(N), Space complexity: O(1)
 */
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else { return nums.count }

        var leadingIndex = 1
        var baseIndex = 0
        
        while leadingIndex < nums.count {
            if nums[leadingIndex] > nums[baseIndex] {
                baseIndex += 1
                nums[baseIndex] = nums[leadingIndex]
            }
            
            leadingIndex += 1
        }
        
        return baseIndex + 1
    }
}
