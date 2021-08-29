### Remove Nth Node From End of List

**Follow up:** Could you do this in one pass?

one pass의 방법이 도저히 떠오르지 않았지만 키포인트는 투포인터였다



### 나의 풀이

```swift
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var arr = [ListNode]()
        var node = head
        while node != nil {
            arr.append(node!)
            node = node?.next
        }
        var head = head
        let ri = arr.count - n
        if arr.count == 1 {
            return nil
        } else if ri == 0 {
            head = arr[0].next
        } else if ri == arr.count-1 {
            arr[ri-1].next = nil
        } else {
            arr[ri-1].next = arr[ri].next
        }
        return head
    }
}
```





### Discuss

```swift
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard head != nil else { return nil }
      // dummy listnode를 만들고
        let d = ListNode(0)
        d.next = head
        var f: ListNode? = d
        var s: ListNode? = d
      // n+1 만큼 앞서나가게 한다
        for _ in 0..<n+1 {
            f = f?.next
        }
      
      //f의 next가 nil이 나올때가지 앞으로 가고
        while f != nil {
            f = f?.next
            s = s?.next
        }
      // 삭제 노드를 제거해준다
        s?.next = s?.next?.next
      // 만약 [1], 1일 경우 head를 리턴하면 오답이 나오기 때문에 주의
        return d.next
    }
}
```

