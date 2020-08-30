"""
973. K Closest Points to Origin

We have a list of points on the plane.  Find the K closest points to the origin (0, 0).
(Here, the distance between two points on a plane is the Euclidean distance.)

You may return the answer in any order.  The answer is guaranteed to be unique (except for the order that it is in.)
"""
class Solution:
    def kClosest(self, points: List[List[int]], K: int) -> List[List[int]]:
        # return self.heap(points, K)
        return self.bySort(points, K)
    
    # Time complexity: O(nlogn), Space complexity: O(n)
    def heap(self, points, K) -> list:
        if not points or len(points) <= 1:
            return points
        
        heap = []
        heapq.heapify(heap)
        
        for point in points:
            distance = self.distanceFromOrigin(point)
            heapq.heappush(heap, (distance, point))
        
        closest = []
        for i in range(K):
            closest.append(heapq.heappop(heap)[1])
    
        return closest
    
    # Time complexity: O(nlogn), Space complexity: O(1)
    def bySort(self, points, K) -> list:
        if not points or len(points) <= 1:
            return points
        
        points.sort(key=lambda x: self.distanceFromOrigin(x))
        
        return points[0:K]
    
    def distanceFromOrigin(self, point) -> int:
        x, y = point
        return x*x + y*y
