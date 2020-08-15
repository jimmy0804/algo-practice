# 435. Non-overlapping Intervals
# Given a collection of intervals, find the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.
#
# Time complexity: O(n), Space complexity: O(1)
def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
    if not intervals:
        return 0
    
    overlapCount = 0
    maxRange = float("-inf")

    # [[1,2],[2,3],[1,3],[3,4]]
    # max: 2 -> 3 -> 4
    
    # Sort the array by max interval so that we can fit the most intervals in the process
    intervals.sort(key=lambda x: x[1])
    
    for i, item in enumerate(intervals):
        if item[0] >= maxRange:
            maxRange = item[1]
        else:
            overlapCount += 1
            
    return overlapCount
