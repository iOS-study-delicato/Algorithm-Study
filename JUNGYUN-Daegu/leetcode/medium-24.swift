// LeetCode Medium 24. Swap Nodes in Pairs
// https://leetcode.com/problems/swap-nodes-in-pairs/
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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard head != nil && head!.next != nil else { return head }
        
        let dummyNode = ListNode(0)
        dummyNode.next = head
        var previous = dummyNode
        var lhs: ListNode? = dummyNode.next
        var rhs: ListNode? = dummyNode.next?.next
        
        while lhs != nil {
            if rhs == nil {
                lhs = nil
            } else {
                let temp = lhs
                previous.next = rhs
                temp!.next = rhs!.next
                rhs!.next = temp
                
                previous = previous.next!.next!
                lhs = temp?.next
                rhs = temp?.next?.next
            }
            
        }
        
        return dummyNode.next
    }
}
