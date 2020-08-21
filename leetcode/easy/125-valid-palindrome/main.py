# 125. Valid Palindrome

class Solution:
    # Time complexity: O(s / 2) = O(s) where s = len(s)
    # Space complexity: O(1)
    def isPalindrome(self, s: str) -> bool:
        if not s:
            return True
        
        start = 0
        end = len(s) - 1
        
        while start < end:
            if s[start].isalnum() and s[end].isalnum():
                if s[start].lower() == s[end].lower():
                    start += 1
                    end -= 1
                else:
                    return False
            elif not s[start].isalnum():
                start += 1
            else:
                end -= 1
        
        return True

print(Solution().isPalindrome("A man, a plan, a canal: Panama"))
print(Solution().isPalindrome("race a car"))
print(Solution().isPalindrome("0r"))
print(Solution().isPalindrome("0dffd0"))
print(Solution().isPalindrome("0dff10"))
