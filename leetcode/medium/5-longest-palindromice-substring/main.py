# 5. Longest Palindromic Substring
# Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
class Solution:
    # Time complexity: O(s / 2 * s) = O(s ^ 2), Space complexity: O(1)
    def longestPalindrome(self, s: str) -> str:
        if len(s) < 2:
            return s
        
        substring = ""
        for i, char in enumerate(s):
            p = self.isPalindrome(s, i, i) # O(s / 2)
            q = self.isPalindrome(s, i, i + 1) # O(s / 2)
            if len(p) > len(substring):
                substring = p
            if len(q) > len(substring):
                substring = q
        
        return substring
        
    
    # Time complexity: O(s / 2), Space complexity: O(1)
    def isPalindrome(self, s: str, left: int, right: int) -> str:
        if left < 0 or right >= len(s):
            return ""
        
        if s[left] != s[right]:
            return ""

        while left >= 0 and right < len(s) and s[left] == s[right]:
            left -= 1
            right += 1
        
        return s[(left + 1):right]
        
        
