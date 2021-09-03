# LeetCode

## [19. Remove Nth Node From End of List](https://leetcode.com/problems/remove-nth-node-from-end-of-list/)

* 난이도: Medium
* 풀이 언어: Swift
* 문제 요약: 리스트의 끝에서 n번째 노드를 제거
* Follow up:  Could you do this in one pass?

### 코드

```swift
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var first: ListNode? = dummy
        var second: ListNode? = dummy
        for _ in 1...(n + 1) {
            first = first?.next
        }
        while first != nil {
            first = first?.next
            second = second?.next
        }
        second?.next = second?.next?.next
        return dummy.next
    }
}
```

* Time complexity: *O(L)*
* Space complexity: *O(1)*

### 회고

* 문제와 함께 제공되는 [Solution](https://leetcode.com/problems/remove-nth-node-from-end-of-list/solution/)(풀이 방법 및 Java 코드)을 참고해서 풀었다.
* 이 풀이의 핵심은 first와 second 사이 간격을 n만큼 둔 후, first가 `nil`이 될 때까지 first와 second 노드를 이동시켜주는 것. 그렇게 하면 one pass만에 뒤에서 n번째 노드가 무엇인지 알 수 있다. n번째 노드를 제거해야 하므로 n번째 직전 노드의 next 값을 n번째 노드의 다음 노드로 연결시켜주면 끝!
* 좀더 간단하게 two pass로 풀기 위해선 while문으로 리스트의 길이를 구한 후 `Length - n + 1`번째의 노드를 제거하면 된다.