# 905. Sort Array By Parity

# Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.

# You may return any answer array that satisfies this condition.
class Solution:
    def sortArrayByParity(self, A: List[int]) -> List[int]:
        return self.inPlace(A)

    # Time Complexity: O(n), Space Complexity: O(1)
    def inPlace(self, A: List[int]) -> List[int]:
        left = 0
        right = len(A) - 1

        while left < right:
            # 1 3 2 4
            if A[left] % 2 == 1 and A[right] % 2 == 0:
                temp = A[left]
                A[left] = A[right]
                A[right] = temp
                left += 1
                right -= 1
            elif A[right] % 2 == 0: # 2 1 3 4
                left += 1
            elif A[right] % 2 == 1: # 1 2 4 3
                right -= 1
            else: # 2 1 4 3
                left +=1
                right -= 1
        
        return A
    
    # Time Complexity: O(n), Space Complexity: O(a) where a = len(a)
    def twoArrays(self, A: List[int]) -> List[int]:
        even = []
        odd = []
        
        for a in A:
            if a % 2 == 0:
                even.append(a)
            else:
                odd.append(a)
        
        return even + odd
                
                
