/**
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.

 A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
 */
class Solution {
    // Time complexity: O(3^n * 4^m) where m + n = length of digits
    // Space complexity: O(3^n & 4^m) since we need to store that amount of results
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else { return [] }
        let map = [
            "2": "abc",
            "3": "def",
            "4": "ghi",
            "5": "jkl",
            "6": "mno",
            "7": "pqrs",
            "8": "tuv",
            "9": "wxyz"
        ]

        // return loopSolution(digits, map)
        
        var result = [String]()
        var partialResult = [String]()
        backtrack(digits, &partialResult, map, &result)
        return result
    }

    private func backtrack(_ digits: String, _ partialResult: inout [String], _ map: [String: String], _ result: inout [String]) {
        guard digits.count > 0 else {
            result.append(partialResult.joined())
            return
        }
        
        let digit = String(digits[digits.startIndex])
        let letters = map[digit]!

        for char in letters {
            partialResult.append(String(char))

            let remaingDigits = String(digits[digits.index(after: digits.startIndex)..<digits.endIndex])
            backtrack(remaingDigits, &partialResult, map, &result)
            
            partialResult.removeLast()
        }
    }
    
    private func loopSolution(_ digits: String, _ map: [String: String]) -> [String] {
        var result = [String]()
        var digits = digits

        while !digits.isEmpty {
            let digit = String(digits[digits.startIndex])
            let letters = map[digit]!
            
            var newResult = [String]()
            
            if result.isEmpty {
                for letter in letters {
                    newResult.append(String(letter))
                }
            } else {
                for re in result {
                    // adx, ady, adz, ae, af, bd, be, bf, cd, ce, cf
                    for letter in letters {
                        newResult.append(re + String(letter))
                    }
                 }
            }
            
            digits = String(digits[digits.index(after: digits.startIndex)..<digits.endIndex])
            result = newResult
        }
        
        return result
    }
}
