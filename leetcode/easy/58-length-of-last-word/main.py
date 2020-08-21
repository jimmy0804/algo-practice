# 58. Length of Last Word
class Solution:
    # Time complexity: O(s) where s = len(s), Space complexity: O(1)
    def lengthOfLastWord(self, s: str) -> int:
        # return self.noBrainer(s)

        left = 0
        right = 0
        
        # "hello "
        #. ^
        #       ^
        # "hello world"
        # " "
        # ""
        # "hello"
        
        wordLength = 0
        
        while left < len(s) and right < len(s):
            if s[right] == ' ':
                right += 1
                left = right
            else:
                wordLength = right - left + 1
                right += 1

        return  wordLength

    def noBrainer(self, s: str) -> int:
        return len(s.strip().split(' ')[-1])

print(Solution().lengthOfLastWord("hello "))
print(Solution().lengthOfLastWord(""))
print(Solution().lengthOfLastWord("hello world"))
print(Solution().lengthOfLastWord("hello"))
print(Solution().lengthOfLastWord(" "))
