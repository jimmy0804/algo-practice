 # 5. Longest Palindromic Substring
 # Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
 #
 # Time complexity: O(n + chars), Space complexity: O(chars)
def longestPalindrome(self, s: str) -> int:
    dict = {}
    
    for char in s:
        if char in dict:
            dict[char] += 1
        else:
            dict[char] = 1
    
    total = 0
    hasOne = False

    for key, item in dict.items():
        # if charaters count is even, that means this char can form a palindrome
        if item % 2 == 0:
            total += item
        else:
            # odd count, still possible to form a palindrome if skip one char
            if hasOne == False:
                hasOne = True
            total += item - 1

    # add one back if we have encounted at least one odd charater count
    # because even + 1 is still a valid palindrome.
    if hasOne is True:
        total += 1
    return total
