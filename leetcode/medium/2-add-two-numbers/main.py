
# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

# You may assume the two numbers do not contain any leading zero, except the number 0 itself.

# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    # Time complexity: O(max(l1, l2)), Space complexity: O(max(l1, l2) + 1)
    def addTwoNumbers(self, l1: ListNode, l2: ListNode) -> ListNode:
        dummy = ListNode()
        l3 = dummy
        sum = 0

        while l1 or l2:
            if l1:
                sum += l1.val
                l1 = l1.next
                
            if l2:
                sum += l2.val
                l2 = l2.next
            
            l3.next = ListNode(sum % 10)
            l3 = l3.next
            sum //= 10
        
        if sum > 0:
            l3.next = ListNode(sum)
        
        return dummy.next
        
        
        
        
            
