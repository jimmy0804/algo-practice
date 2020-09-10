"""
    253. Meeting Rooms II

    Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), find the minimum number of conference rooms required.
    
    Time complexity: O(nlogn)
    Space complexity: O(r)
"""
class Solution:
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        if not intervals:
            return 0
        
        intervals.sort()
        rooms = []
        heapq.heapify(rooms)
        
        for interval in intervals:
            if not rooms or interval[0] < rooms[0]:
                heapq.heappush(rooms, interval[1])
                continue
            
            heapq.heapreplace(rooms, interval[1])
        
        return len(rooms)
            
        
        
    
    
