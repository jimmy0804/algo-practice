/**
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    // Time complexity: O(n), memory: O(n)
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var remainer = 0
        
        var number1 = l1
        var number2 = l2

        var tenth = 1
        var dummy: ListNode? = ListNode()
        var head = dummy
        var result = 0
        
        while number1 != nil || number2 != nil {
            let first = number1?.val ?? 0
            let second = number2?.val ?? 0
            
            let current = first + second + remainer
            let newNumber = current % 10
            remainer = current / 10
            
            result += newNumber * 10 * tenth
            tenth += 1
            
            head?.next = ListNode(newNumber)
            head = head?.next
            
            number1 = number1?.next
            number2 = number2?.next
        }
        
        if remainer != 0 {
            head?.next = ListNode(remainer)
        }
        
        return dummy?.next
    }
}
