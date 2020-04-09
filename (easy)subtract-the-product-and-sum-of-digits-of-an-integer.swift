/**
 1281. Subtract the Product and Sum of Digits of an Integer
 Runtime: 8 ms, faster than 37.25% of Swift online submissions for Subtract the Product and Sum of Digits of an Integer.
 Memory Usage: 20.8 MB, less than 100.00% of Swift online submissions for Subtract the Product and Sum of Digits of an Integer.
 */
class Solution {
    func subtractProductAndSum(_ n: Int) -> Int {
        var num = n
        var product = 1
        var sum = 0
        while num > 0 {
            let digit = num % 10
            num = num / 10
            
            product *= digit
            sum += digit
        }
        
        return product - sum
    }
}
