/**
    229. Majority Element II
 
    Given an integer array of size n, find all elements that appear more than ⌊ n / 3 ⌋ times.
    Note: The algorithm should run in linear time and in O(1) space.
 
    Time complexity: O(n)
    Space complexity: O(1)
 */
class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        var majority1 = 0
        var count1 = 0
        var majority2 = 0
        var count2 = 0
        
        for num in nums {

            if num == majority1 {
                count1 += 1
                continue
            }
            
            if num == majority2 {
                count2 += 1
                continue
            }
            
            if count1 == 0 {
                majority1 = num
                count1 += 1
                continue
            }
            
            if count2 == 0 {
                majority2 = num
                count2 += 1
                continue
            }
            
            count1 -= 1
            count2 -= 1
        }
        
        var result = [Int]()
        let target = nums.count / 3
        count1 = 0
        count2 = 0
        for num in nums {
            if num == majority1 {
                count1 += 1
            }
            
            if num == majority2 {
                count2 += 1
            }
        }
        
        if count1 > target {
            result.append(majority1)
        }
        
        if majority2 != majority1, count2 > target {
            result.append(majority2)
        }
        
        return result
    }
}
