/*
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 */
class Solution {
    // Time complexity: O(n), memory: O(n)
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        
        for (i, num) in nums.enumerated() {
            if let targetIndex = map[num] {
                return [i, targetIndex]
            }
            
            map[target - num] = i
        }
        
        return []
    }
}
