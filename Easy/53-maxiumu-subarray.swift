/**
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
 */
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        return onePass(nums)
    }
    
    // Time complexity: O(n), Space complexity: O(1)
    private func onePass(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return Int.min }
        var maxSum = Int.min
        var current = 0
        
        for num in nums {
            current = max(num, current + num)
            maxSum = max(maxSum, current)
        }
        
        return maxSum
    }
    
    // Time complexity: O(n^2), Space complexity: O(1)
    private func twoPasses(_ nums: [Int]) -> Int {
         guard nums.count > 0 else { return Int.min }
        var maxSum = Int.min

        for i in 0..<nums.count {
            var currentMax = 0
            for j in i..<nums.count {
                currentMax += nums[j]
                maxSum = max(maxSum, currentMax)
            }
        }
        
        
        return maxSum
    }
}
