## Same Tree

재귀를 이용해서 풀 생각을 해보자!

```swift
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        if p == nil || q == nil { return false }
        
        func dfs(node: TreeNode?) -> [TreeNode?] {
            var discovery = [TreeNode?]()
            var stack = [node]
            while !stack.isEmpty {
                let e = stack.popLast()!
                discovery.append(e)
              // e가 nil이면 넣을 필요가 없다
                if e != nil {
                    stack.append(e?.left)
                    stack.append(e?.right)
                }
            }
            return discovery
        }
        
        let pp = dfs(node: p).map({ $0?.val })
        let qq = dfs(node: q).map({ $0?.val })
        
        return pp == qq
    }
}
```







### 다른 풀이



```swift
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if(p == nil && q == nil) {return true}
        if(p == nil || q == nil) {return false}
        if(p!.val != q!.val) {return false}
        return isSameTree(p!.left, q!.left) && isSameTree(p!.right, q!.right)
    }
}
```

