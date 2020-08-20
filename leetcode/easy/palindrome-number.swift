class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        
        let digits = convertIntToDigits(number: x)
        
        for (i, digit) in digits.enumerated() {
            let firstIndex = i
            let lastIndex = digits.count - (i + 1)
            let first = digit
            let last = lastIndex < digits.count ? digits[lastIndex] : nil
            
            if let last = last {
                if firstIndex != lastIndex, first != last {
                    print(firstIndex, lastIndex, first, last)
                    return false
                }
                
                if lastIndex < firstIndex {
                    break
                }
            }
        }

        return true
    }
    
    func convertIntToDigits(number: Int) -> [Int] {
        var remainingNumber = number
        var digits = [Int]()
        
        while remainingNumber > 0 {
            let digit = remainingNumber % 10
            digits.append(digit)
            remainingNumber =  remainingNumber / 10
        }

        return digits.reversed()
    }
}
