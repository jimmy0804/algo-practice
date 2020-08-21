# 67. Add Binary

class Solution:
    # Time complexity: O(max(len(a), len(b) + r), Space complexity: O(r) r = result
    def addBinary(self, a: str, b: str) -> str:
        first = len(a) - 1
        second = len(b) - 1
        carry = 0
        result = []
        
        while first >= 0 or second >= 0 or carry > 0:
            sumFirst = int(a[first]) if first >=0 else 0
            sumSecond = int(b[second]) if second >=0 else 0
            sum = sumFirst + sumSecond + carry

            if sum > 1:
                carry = 1
                result.append(str(sum - 2))
            else:
                carry = 0
                result.append(str(sum))
            
            first -= 1
            second -= 1

        return "".join(result[::-1])
    
    # avoid
    def cheat(self, a: str, b: str) -> str:
        return str(bin(int(a, 2) + int(b, 2)))[2:]

print(Solution().addBinary("1111", "1111"))
print(Solution().addBinary("1010", "1011"))
print(Solution().addBinary("1", "1011"))
