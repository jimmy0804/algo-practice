"""
    1167. Minimum Cost to Connect Sticks

    You have some sticks with positive integer lengths.

    You can connect any two sticks of lengths X and Y into one stick by paying a cost of X + Y.  You perform this action until there is one stick remaining.

    Return the minimum cost of connecting all the given sticks into one stick in this way..
    
    Time complexity: O(nlogn)
    Space complexity: O(n)
"""
class Solution:
    def connectSticks(self, sticks: List[int]) -> int:
        if not sticks:
            return 0
        
        if len(sticks) == 1:
            return 0

        heap = [stick for stick in sticks]
        
        heapq.heapify(heap)
        
        total = 0
        while len(heap) > 1:
            sum = heapq.heappop(heap) + heapq.heappop(heap)
            total += sum
            heapq.heappush(heap, sum)
        
        return total
        
        
    
    
