"""
    983. Minimum Cost For Tickets

    In a country popular for train travel, you have planned some train travelling one year in advance.  The days of the year that you will travel is given as an array days.  Each day is an integer from 1 to 365.

    Train tickets are sold in 3 different ways:

    a 1-day pass is sold for costs[0] dollars;
    a 7-day pass is sold for costs[1] dollars;
    a 30-day pass is sold for costs[2] dollars.
    The passes allow that many days of consecutive travel.  For example, if we get a 7-day pass on day 2, then we can travel for 7 days: day 2, 3, 4, 5, 6, 7, and 8.

    Return the minimum number of dollars you need to travel every day in the given list of days.
    
    Time complexity: O(d)
    Space complexity: O(d)
"""
class Solution:
    def mincostTickets(self, days: List[int], costs: List[int]) -> int:
        return self.dfs(days, costs, {})
    
    def dfs(self, days, costs, memo):
        if not days:
            return 0
        
        if tuple(days) in memo:
            return memo[tuple(days)]

        oneDayPassTotalCost = costs[0] + self.dfs(days[1:], costs, memo)
        
        sevenDays = days[:]
        if len(sevenDays) > 1:
            sevenDays[0] += 6
            for i in range(1, len(sevenDays)):
                if sevenDays[i] > sevenDays[0]:
                    sevenDays = sevenDays[i:]
                    break
                
                if i == len(sevenDays) - 1:
                    sevenDays = []
            
        else:
            sevenDays = []
            
        sevenDayPassTotalCost = costs[1] + self.dfs(sevenDays, costs, memo)
        
        thirtyDays = days[:]
        if len(thirtyDays) > 1:
            thirtyDays[0] += 29
            for i in range(1, len(thirtyDays)):
                if thirtyDays[i] > thirtyDays[0]:
                    thirtyDays = thirtyDays[i:]
                    break
                
                if i == len(thirtyDays) - 1:
                    thirtyDays = []
        else:
            thirtyDays = []

        thirtyDayPassTotalCost = costs[2] + self.dfs(thirtyDays, costs, memo)

        memo[tuple(days)] = min(oneDayPassTotalCost, sevenDayPassTotalCost, thirtyDayPassTotalCost)

        return memo[tuple(days)]
            
        
        
    
    
