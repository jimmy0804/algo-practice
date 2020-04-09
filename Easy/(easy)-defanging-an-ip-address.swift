/**
 Runtime: 20 ms. faster than 45.17% of Swift online submissions
 Memory Usage: 20.3MB, less than 100.00% of Swift online submissions
 */
class Solution {
    func defangIPaddr(_ address: String) -> String {
        var result = ""
        for char in address {
            result += char == "." ? "[.]" : "\(char)"
        }
        return result
    }
}

/**
 Runtime: 8 ms, faster than 45.17% of Swift online submissions for Defanging an IP Address.
 Memory Usage: 21.1 MB, less than 100.00% of Swift online submissions for Defanging an IP Address.
 */
class Solution {
    func defangIPaddr(_ address: String) -> String {
        return address.map { $0 == "." ? "[.]" : "\($0)" }.reduce("", +)
    }
}


/**
 Runtime: 8 ms, faster than 45.17% of Swift online submissions for Defanging an IP Address.
 Memory Usage: 21.6 MB, less than 100.00% of Swift online submissions for Defanging an IP Address.
 */
class Solution {
    func defangIPaddr(_ address: String) -> String {
        return address.replacingOccurrences(of: ".", with: "[.]")
    }
}
