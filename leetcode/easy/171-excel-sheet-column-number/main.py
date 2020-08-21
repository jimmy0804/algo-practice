#171. Excel Sheet Column Number

class Solution:
    # Time complexity: O(s) where s = len(s)
    # Space complexity: O(1)
    def titleToNumber(self, s: str) -> int:
        result = 0

        for char in s:
            charNumber = ord(char) - ord('A') + 1
            result  = result * 26 + charNumber

        return result

print(Solution().titleToNumber("ZY"))
print(Solution().titleToNumber("A"))
print(Solution().titleToNumber("ZZZYYDS"))
print(Solution().titleToNumber(""))
