/**
 Given a linked list, remove the n-th node from the end of list and return its head.
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
    /// Time complexity: O(n), Memory: O(1)
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        var dummy: ListNode? = ListNode()
        dummy?.next = head

        var fastPointer = dummy
        var slowPointer = dummy
        
        for i in 0..<n {
            fastPointer = fastPointer?.next
        }
        
        while fastPointer?.next != nil {
            fastPointer = fastPointer?.next
            slowPointer = slowPointer?.next
        }

        slowPointer?.next = slowPointer?.next?.next
        return dummy?.next
    }
}
