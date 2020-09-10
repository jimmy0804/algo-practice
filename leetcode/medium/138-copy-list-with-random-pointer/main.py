"""
    138. Copy List with Random Pointer

    A linked list is given such that each node contains an additional random pointer which could point to any node in the list or null.

    Return a deep copy of the list.

    The Linked List is represented in the input/output as a list of n nodes. Each node is represented as a pair of [val, random_index] where:

    val: an integer representing Node.val
    random_index: the index of the node (range from 0 to n-1) where random pointer points to, or null if it does not point to any node.
    
    Time complexity: O(n)
    Space complexity: O(n)
"""
"""
# Definition for a Node.
class Node:
    def __init__(self, x: int, next: 'Node' = None, random: 'Node' = None):
        self.val = int(x)
        self.next = next
        self.random = random
"""

class Solution:
    def copyRandomList(self, head: 'Node') -> 'Node':
        dummy = Node(0)
        dummyHead = dummy
        
        savedNodes = {}
        
        while head:
            currentHead = head
            
            if currentHead not in savedNodes:
                savedNodes[currentHead] = Node(currentHead.val)

            if currentHead.random and currentHead.random not in savedNodes:
                randomHead = Node(currentHead.random.val)
                savedNodes[currentHead.random] = randomHead

            dummyHead.next = savedNodes[currentHead]
            if currentHead.random:
                dummyHead.next.random = savedNodes[currentHead.random]
            
            dummyHead = dummyHead.next
            head = head.next
        
        return dummy.next
        
        
    
    
