### Diameter of Binary Tree

트리의 직경을 구하는 문제다

맨 밑에까지 탐색(DFS)을 해서 가장 큰 값을 알아내는게 핵심이다

-1은 거리를 맞추기위해 nil의 경우 -1을 리턴한다



```swift
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var result = 0
        func DFS(_ node: TreeNode?) -> Int {
            if node == nil {
                return -1
            }
            
            let left = DFS(node?.left)
            let right = DFS(node?.right)
            
            result = max(result, left + right + 2)
            
            return max(left + 1, right + 1)
            
        }
        
        _ = DFS(root)
        return result
    }
}
```

