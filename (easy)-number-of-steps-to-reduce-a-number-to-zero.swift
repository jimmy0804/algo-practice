/**
 Runtime: 8 ms, faster than 44.20% of Swift online submissions for Number of Steps to Reduce a Number to Zero.
 Memory Usage: 20.8 MB, less than 100.00% of Swift online submissions for Number of Steps to Reduce a Number to Zero.
 */
class Solution {
    func numberOfSteps (_ num: Int) -> Int {
        guard num > 0 else { return 0 }
        var numToTest = num
        var steps = 0
        while numToTest > 0 {
            let isEven = numToTest % 2 == 0
            numToTest = isEven ? numToTest / 2 : numToTest - 1
            steps += 1
        }
        return steps
    }
}
