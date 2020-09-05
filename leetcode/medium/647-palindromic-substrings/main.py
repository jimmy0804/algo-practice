"""
    647. Palindromic Substrings
    
    Given a string, your task is to count how many palindromic substrings in this string.

    The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.
    
    Time complexity: O(n ^ 2)
    Space complexity: O(1)
"""
class Solution:
    def countSubstrings(self, s: str) -> int:
        result = 0
        
        for i, char in enumerate(s):
            result += self.expand(s, i, i)
            result += self.expand(s, i, i + 1)
        
        return result
    
    def expand(self, s, left, right) -> int:
        count = 0
        while left >= 0 and right < len(s) and s[left] == s[right]:
            count += 1
            left -=1
            right +=1
        
        return count
