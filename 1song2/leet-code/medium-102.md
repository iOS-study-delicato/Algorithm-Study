# LeetCode

## [Binary Tree Level Order Traversal](https://leetcode.com/problems/binary-tree-level-order-traversal/)

* 난이도: Medium
* 풀이 언어: Swift
* 문제 요약: binary tree의 level별로 node의 value를 이차원 배열로 반환

### 코드

```swift
// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
 
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        guard let root = root else { return [] }
        var totalQueue: [TreeNode] = [root]
        while !totalQueue.isEmpty {
            var traversal: [Int] = []
            (0..<totalQueue.count).forEach { _ in
                let node = totalQueue.removeFirst()
                traversal.append(node.val)
                if let left = node.left {
                    totalQueue.append(left)
                }
                if let right = node.right {
                    totalQueue.append(right)
                }
            }
            result.append(traversal)
        }
        return result
    }
}
```

### 회고

* BFS를 알고 푸니 그렇게 어렵지 않았다..! (이래서 공부가 중요합니다...)
* reduce, compactMap 등의 고차함수를 사용해서 풀이하면 코드가 매우 간결해지는 것 같다. 시간이 지나고 다시 한번 도전해봐야 할 듯!