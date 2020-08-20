/**
 13. Roman to Integer
 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
 Time complexity: O(n) Space complexity: O(1)
 */
class Solution {
    func romanToInt(_ s: String) -> Int {
        var map = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        
        var result = 0
        var previous = ""
        
        var i = s.index(before: s.endIndex)
        
        // CDCIIX
        while i >= s.startIndex {
            let current = String(s[i])

            switch previous {
                case "V" where current == "I" ,"X" where current == "I":
                    fallthrough
                case "L" where current == "X", "C" where current == "X":
                    fallthrough
                case "D" where current == "C", "M" where current == "C":
                    result -= map[current]!
                default:
                    previous = current
                    result += map[current]!
            }
            
            if i == s.startIndex {
                break
            }
            
            i = s.index(before: i)
        }

        return result
    }
}
