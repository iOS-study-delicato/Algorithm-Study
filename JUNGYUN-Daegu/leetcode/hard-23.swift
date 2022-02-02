// LeetCode Hard 23. Merge k Sorted Lists
// https://leetcode.com/problems/merge-k-sorted-lists/
// 22.02.02


//  Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        
        func divide(lists: [ListNode?]) -> ListNode? {
            if lists.count == 1 {
                return lists[0]
            } else if lists.count == 0 {
                return nil
            }
            
            let mid = (lists.count - 1) / 2
            let lhs = Array(lists[0...mid])
            let rhs = Array(lists[mid + 1...lists.count - 1])
            
            return mergeTwoList(lhs: divide(lists: lhs), rhs: divide(lists: rhs))
        }
        
        return divide(lists: lists)
    }
    
    func mergeTwoList(lhs: ListNode?, rhs: ListNode?) -> ListNode? {
        let dummyHead = ListNode(Int.min)
        var current = dummyHead
        
        var lhs = lhs
        var rhs = rhs
        
        while lhs != nil || rhs != nil {
            if lhs == nil && rhs != nil {
                current.next = rhs
                current = current.next!
                rhs = rhs!.next
            } else if rhs == nil && lhs != nil {
                current.next = lhs
                current = current.next!
                lhs = lhs!.next
            } else {
                if lhs!.val < rhs!.val {
                    current.next = lhs
                    current = current.next!
                    lhs = lhs!.next
                } else {
                    current.next = rhs
                    current = current.next!
                    rhs = rhs!.next
                }
            }
        }
        return dummyHead.next
    }
    
}

