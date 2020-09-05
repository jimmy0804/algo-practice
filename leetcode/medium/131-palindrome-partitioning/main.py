"""
    131. Palindrome Partitioning

    Given a string s, partition s such that every substring of the partition is a palindrome.

    Return all possible palindrome partitioning of s.
    
    Time complexity: O(n ^ 2)
    Space complexity: O(n)
"""
class Solution:
    def __init__(self):
        self.result = []

    def partition(self, s: str) -> List[List[str]]:
        if not s:
            return []
        
        self.backtracking(s, [])
        return self.result
        
    def backtracking(self, s, partial):
        if not s:
            self.result.append(partial[:])
            return
        
        for i in range(len(s)):
            substring = s[:i+1]
            if not self.isPalindrome(substring):
                continue

            partial.append(substring)
            self.backtracking(s[i + 1:], partial)
            partial.pop()
        
    def isPalindrome(self, s):
        return s == s[::-1]
        
        
    
    
