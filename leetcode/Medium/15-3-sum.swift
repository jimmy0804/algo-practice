/*
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 */
class Solution {
    // Time complexity: O(n^2), space complexity: O(1)
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [] }
        var result = [[Int]]()
        
        // [-4, -1, -1, 0, 1, 2]
                 // ^      ^^
        
        // [0, 0, 0]
        //  ^  ^  ^
        var nums = nums.sorted()
        
        for i in 0..<nums.count - 2 {
            guard i == 0 || i > 0 && nums[i] != nums[i - 1] else { continue }
            
            var start = i + 1
            var end = nums.count - 1
            
            while start < end {
                if nums[i] + nums[start] + nums[end] == 0 {
                    result.append([nums[i], nums[start], nums[end]])
                }
                
                if nums[i] + nums[start] + nums[end] < 0 {
                    var currentStart = start
                    while nums[currentStart] == nums[start], start < nums.count - 1 {
                        start += 1
                    }
                } else {
                    var currentEnd = end
                    while nums[currentEnd] == nums[end], end > 0 {
                        end -= 1
                    }
                }
            }
        }
        
        return result
    }
}
