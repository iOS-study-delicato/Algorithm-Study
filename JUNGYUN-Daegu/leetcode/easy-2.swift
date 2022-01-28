// LeetCode Easy 2. Add Two Numbers
// https://leetcode.com/problems/add-two-numbers/
// 22.01.26


// Definition for singly-linked list.
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var result: [Int] = []
        var carry: Int = 0
        
        var node1: ListNode? = l1
        var node2: ListNode? = l2
        
        while node1 != nil || node2 != nil {
            let val1 = node1 == nil ? 0 : node1!.val
            let val2 = node2 == nil ? 0 : node2!.val
            
            let sum = val1 + val2 + carry
            
            carry = sum / 10
            result.append(sum % 10)
                
            node1 = node1?.next
            node2 = node2?.next
        }
        
        if carry != 0 {
            result.append(carry)
        }
        
        let dummyHead: ListNode = ListNode(result[0])
        var currentNode: ListNode = dummyHead
        
        for k in 1..<result.count {
            currentNode.next = ListNode(result[k])
            currentNode = currentNode.next!
        }
        
        return dummyHead
    }
}

