/**
 Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.

 Note:

 The solution set must not contain duplicate quadruplets.
 */
class Solution {
    // Time complexity: O(n^3), space complexity: O(1)
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else { return [] }
        // -2 -1 0 0 1 2
        //  ^  ^     ^ ^
        
        var nums = nums.sorted()
        var result = [[Int]]()
        
        for i in 0..<nums.count {
            guard i == 0 || nums[i] != nums[i - 1] else { continue }

            for j in (i + 1)..<nums.count {
                guard j == (i + 1) || nums[j] != nums[j - 1] else { continue }
                
                var start = j + 1
                var end = nums.count - 1
                
                while start < end {
                    let sum = nums[i] + nums[j] + nums[start] + nums[end]
                    if sum == target {
                        result.append([nums[i], nums[j], nums[start], nums[end]])
                    }
                    
                    if sum < target {
                        let currentStart = start
                        while nums[currentStart] == nums[start], start < nums.count - 1 {
                            start += 1
                        }
                    } else {
                        let currentEnd = end
                        while nums[currentEnd] == nums[end], end > j {
                            end -= 1
                        }
                    }
                }
            }
        }
        
        return result
    }
}
