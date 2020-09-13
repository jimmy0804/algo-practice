"""
    57. Insert Interval
    
    Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).

    You may assume that the intervals were initially sorted according to their start times.
    
    Time complexity: O(n)
    Space complexity: O(n)
"""

class Solution:
def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
    if not intervals:
        return [newInterval]
    
    isInserted = False
    result = []
    for interval in intervals:
        start, end = newInterval[0], newInterval[1]
        
        if isInserted:
            if self.isOverlapping(result[-1], interval):
                result[-1][1] = max(interval[1], result[-1][1])
            else:
                result.append(interval)
            continue

        if start > interval[1]:
            result.append(interval)
        elif end < interval[0]:
            result.append(newInterval)
            result.append(interval)
            isInserted = True
        else:
            result.append(self.merge(interval, newInterval))
            isInserted = True
    
    if not isInserted:
        result.append(newInterval)
    
    return result
       
def isOverlapping(self, interval1, interval2):
    return interval2[0] >interval1[0] and interval2[0] <= interval1[1]

def merge(self, interval1, interval2):
    return [min(interval1[0], interval2[0]), max(interval1[1], interval2[1])]
    
