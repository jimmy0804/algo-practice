"""
    23. Merge k Sorted Lists
    
    You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.
    Merge all the linked-lists into one sorted linked-list and return it.
"""
class Solution:
    def mergeKLists(self, lists: List[ListNode]) -> ListNode:
        # return self.useHeap(lists)
        return self.divideAndConquer(lists)
    
    def divideAndConquer(self, lists: List[ListNode]) -> ListNode:
        if not lists:
            return None
        
        if len(lists) == 1:
            return lists[0]
        
        def merge(left, right) -> ListNode:
            dummyHead = ListNode()
            head = dummyHead
            while left or right:
                if left and right:
                    if left.val < right.val:
                        head.next = left
                        head = head.next
                        left = left.next
                    else:
                        head.next = right
                        head = head.next
                        right = right.next
                    
                    continue
                
                if left:
                    head.next = left
                    head = head.next
                    left = left.next
                    continue
                
                if right:
                    head.next = right
                    head = head.next
                    right = right.next
                    continue
            
            return dummyHead.next
        
        mid = len(lists) // 2
        left = self.divideAndConquer(lists[:mid])
        right = self.divideAndConquer(lists[mid:])
        return merge(left, right)
    
    # Time complexity: O(max(klogn)
    def useHeap(self, lists: List[ListNode]) -> ListNode:
        if not lists:
            return None
        
        heap = []
        for i, node in enumerate(lists):
            if node:
                heap.append((node.val, i, node))
        heapq.heapify(heap)
        
        dummyNode = ListNode()
        head = dummyNode
        while heap:
            val, i, node = heap[0]
            
            if not node.next:
                heapq.heappop(heap)
            else:
                heapq.heapreplace(heap, (node.next.val, i, node.next))
            
            head.next = node
            head = head.next

        
        return dummyNode.next
        
        
    
    # Time complexity: O(nlogn)
    # Space complexity: O(n)
    def bruteForce(self, lists: List[ListNode]) -> ListNode:
        if not lists:
            return None
        
        result = []
        
        for node in lists:
            head = node
            
            while head:
                result.append(head.val)
                head = head.next
        
        result.sort()
        
        dummyNode = ListNode()
        head = dummyNode
        
        for item in result:
            head.next = ListNode(item)
            head = head.next
        
        return dummyNode.next
