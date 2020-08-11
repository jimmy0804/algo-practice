/**
 Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

 Note: You may not slant the container and n is at least 2.
 */
class Solution {
    // Time complexity: O(n), space complexity: O(1)
    func maxArea(_ height: [Int]) -> Int {
        // 1 8 6 2 5 4 8 3 7
        //   ^             ^
        
        var start = 0
        var end = height.count - 1
        var currentMax = 0
        
        while start < end {
            if height[start] < height[end] {
                currentMax = max(currentMax, (end - start) * height[start])
                start += 1
            } else {
                currentMax = max(currentMax, (end - start) * height[end])
                end -= 1
            }
        }
        
        return currentMax
    }
}
