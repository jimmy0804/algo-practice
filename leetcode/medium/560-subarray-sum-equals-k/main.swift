/**
    560. Subarray Sum Equals K
 
    Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.
 
    Time complexity: O(n)
    Space complexity: O(n)
 */

class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        // [1, 2, 3, 2, -2] k = 5
        // [1, 3, 6, 8, 6]
        //
        //
        //
        
        var map = [Int: Int]()
        map[0] = 1
        
        var sum = 0
        var total = 0
        for num in nums {
            sum += num

            if let occurences = map[sum - k] {
                total += occurences
            }
            
            if map[sum] != nil {
                map[sum]! += 1
            } else {
                map[sum] = 1
            }
        }
        
        return total
    }
}
