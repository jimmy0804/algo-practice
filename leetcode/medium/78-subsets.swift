/**
 Given a set of distinct integers, nums, return all possible subsets (the power set).
 */

class Solution {
    
    
    /**
    Runtime: 24 ms, faster than 9.93% of Swift online submissions for Subsets.
    Memory Usage: 21.4 MB, less than 44.27% of Swift online submissions for Subsets.
    Run time O(2^n), memory O(2^n)
    */
    func subsets(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else { return [[]] }
        var numbers = nums
        var result = [[Int]]()
        result.append([])
        
        for num in nums {
            for i in 0..<result.count {
                let subset = result[i] + [num]
                result.append(subset)
            }
        }
        
        return result
    }
}
