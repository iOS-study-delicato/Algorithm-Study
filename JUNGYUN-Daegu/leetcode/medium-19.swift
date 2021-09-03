public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard head != nil else { return nil }
        
        func findLengthWithRecursiveSolution(_ node: ListNode) -> Int { // you can use loop statement instead
            var result = 1
            
            if node.next != nil {
                result += findLengthWithRecursiveSolution(node.next!)
            }
            
            return result
        }
        let convertedNIndex = findLengthWithRecursiveSolution(head!) - n
        
        var previousNode: ListNode? = nil
        var currentNode: ListNode? = head
        var index = 0
        
        repeat {
            if index == convertedNIndex {
                if previousNode == nil {
                    if currentNode!.next == nil {
                        return nil
                    } else {
                        return currentNode!.next
                    }
                } else {
                    previousNode!.next = currentNode!.next
                    break
                }
                
            } else {
                previousNode = currentNode
                currentNode = currentNode!.next!
                index += 1
            }
            
        } while true
        
        return head
    }
}
