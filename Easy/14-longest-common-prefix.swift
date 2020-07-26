
/**
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".
 */
class Solution {
    // Time complexity: O(M * N), space complexity: O(1)
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }

        let firstString = strs[0]
        var result = ""

        for (i, char) in firstString.enumerated() {
            let currentChar = String(char)
            var isCommon = true

            for compareString in strs {
                if i < compareString.count {
                    let firstCharIndex = compareString.index(compareString.startIndex, offsetBy: i)
                    let char = String(compareString[firstCharIndex...firstCharIndex])
                    if char != currentChar {
                        isCommon = false
                    }
                } else {
                    isCommon = false
                }
            }
            
            if isCommon {
                result += currentChar
            } else {
                break
            }
        }
        
        return result
    }
}
