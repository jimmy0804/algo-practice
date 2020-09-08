/**
    49. Group Anagrams

    Given an array of strings strs, group the anagrams together. You can return the answer in any order.

    An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
 
    Time complexity: O(c * logc * s)
    Space complexity: O(s * c)
*/

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()

        for str in strs {
            let sortedStr = String(str.sorted())
            
            if dict[sortedStr] != nil {
                dict[sortedStr]?.append(str)
            } else{
                dict[sortedStr] = [str]
            }
        }
        
        var result = [[String]]()
        for (key, value) in dict {
            result.append(value)
        }
        
        return result
    }
}
