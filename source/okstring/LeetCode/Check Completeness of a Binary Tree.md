### Check Completeness of a Binary Tree

```swift
class Solution {
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        var q = [root]
        var d = [Int?]()
        while !q.isEmpty {
            let n = q.removeFirst()
            if n == nil { d.append(nil); continue }
            d.append(n?.val)
            q.append(n?.left)
            q.append(n?.right)
        }
        var toggle = true
        for n in d {
            if n == nil {
                toggle = false
            } else if !toggle {
                return false
            }
        }
        return true
    }
}
```





### 불필요한 for문을 줄여보자

```swift
class Solution {
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        var q = [root]
        var d = [Int?]()
        var toggle = true
        while !q.isEmpty {
            let n = q.removeFirst()
            if n == nil {
                toggle = false
                d.append(nil)
                continue
            } else if !toggle {
                return false
            }
            d.append(n?.val)
            q.append(n?.left)
            q.append(n?.right)
        }
        return true
    }
}
```

