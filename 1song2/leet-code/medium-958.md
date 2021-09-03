# LeetCode

## [Check Completeness of a Binary Tree](https://leetcode.com/problems/check-completeness-of-a-binary-tree/)

* 난이도: Medium
* 풀이 언어: Swift
* 문제 요약: 주어진 이진 트리가 완전 이진 트리인지 판별

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
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        var queue: [TreeNode?] = [root]
        var hasNilNode: Bool = false
        while !queue.isEmpty {
            if let node = queue.removeFirst() {
                if hasNilNode {
                    return false
                }
                queue.append(node.left)
                queue.append(node.right)
            } else {
                hasNilNode = true
            }
        }
        return true
    }
}
```

### 회고

* **완전 이진 트리**(完全二進-, [영어](https://ko.wikipedia.org/wiki/영어): complete binary tree)에서, 마지막 레벨을 제외하고 모든 레벨이 완전히 채워져 있으며, 마지막 레벨의 모든 노드는 가능한 한 가장 왼쪽에 있다. [출처](https://ko.wikipedia.org/wiki/이진_트리)
* 완전 이진 트리의 정의에 따라, 노드 중간에 `null` 값이 포함된 경우 (e.g. `[1,2,3,4,5,null,7]`)는 `false` 값을, 그렇지 않은 경우 (e.g. `[1,2,3,4,5,6]`)는 `true` 값을 반환