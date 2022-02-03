// LeetCode Hard 25. Reverse Nodes in k-Group
// https://leetcode.com/problems/reverse-nodes-in-k-group/
// 22.02.03

//  Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil else { return nil }
        
        // create pointers
        let dummyNode = ListNode()
        dummyNode.next = head
        var previous: ListNode = dummyNode
        var current: ListNode? = dummyNode.next
        
        while current != nil {
            var count = 0
            var temp: [ListNode?] = []
        
            // iterate linked list
            while count < k {
                if current != nil {
                    temp.append(current)
                    count += 1
                    current = current!.next
                    
                } else {
                    break
                }
            }
            
            // manipulates orders when needed
            if count == k {
                while !temp.isEmpty {
                    previous.next = temp.popLast()!
                    previous = previous.next!
                    
                    if temp.isEmpty {
                        previous.next = current
                    }
                }
            } else {
                break
            }
        }
        
        return dummyNode.next
    }
}


