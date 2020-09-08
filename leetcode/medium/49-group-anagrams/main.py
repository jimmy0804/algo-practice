"""
    49. Group Anagrams

    Given an array of strings strs, group the anagrams together. You can return the answer in any order.

    An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
    
    Time complexity: O(clogc * s)
    Space complexity: O(s * c)
"""
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        if not strs:
            return []
        
        groups = {}
        
        for str in strs:
            key = tuple(sorted(str))

            if key in groups:
                groups[key].append(str)
            else:
                groups[key] = [str]
        
        result = []
        for key, value in groups.items():
            result.append(value)
            
        return result
        
        
    
    
