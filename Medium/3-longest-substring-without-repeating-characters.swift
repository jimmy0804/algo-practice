/**
 Given a string, find the length of the longest substring without repeating characters.
 */
class Solution {
    // Time complexity: O(n), Memory: O(n)
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }

        var map = [Character: Int]()
        var maxLength = 0, start = 0
        
        for (trailing, char) in s.enumerated() {
            if let oldStart = map[char] {
                start = max(start, oldStart + 1)
            }

            maxLength = max(maxLength, trailing - start + 1)
            map[char] = trailing
        }
        
        return maxLength
    }
}
