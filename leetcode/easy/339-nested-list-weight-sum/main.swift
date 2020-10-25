/**
 339. Nested List Weight Sum
 
 Given a nested list of integers, return the sum of all integers in the list weighted by their depth.

 Each element is either an integer, or a list -- whose elements may also be integers or other lists.
 
 Time complexity: O(n) where n is all numbers
 Space complexity: O(d)
 */

/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */
class Solution {
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        
        var result = 0
        // dfs
        func dfs(_ nestedList: [NestedInteger], _ depth: Int) {
            guard nestedList.count > 0 else { return }
            
            var sum = 0
            for item in nestedList {
                if item.isInteger() {
                    sum += item.getInteger()
                } else {
                    dfs(item.getList(), depth + 1)
                }
            }
            
            result += sum * depth
        }

        dfs(nestedList, 1)
        return result
    }
}
