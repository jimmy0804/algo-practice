#171. Excel Sheet Column Number

class Solution:
    # Time complexity: O(n)
    # Space complexity: O(u) where u = unique num count
    def majorityElement(self, nums: List[int]) -> int:
        dict = {}
        result = 0
        
        for num in nums:
            if num in dict:
                dict[num] += 1
            else:
                dict[num] = 1
        
        for key, value in dict.items():
            if value > len(nums) / 2:
                return key
        
        return -1
    
print(Solution().majorityElement([3,2,3]))
print(Solution().majorityElement(2,2,1,1,1,2,2))
