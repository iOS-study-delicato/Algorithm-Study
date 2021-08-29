### Binary Tree Level Order Traversal



#### Recursive(DFS)

```swift
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var dict = [Int: [Int]]()
        func recursive(_ node: TreeNode?, count: Int) {
            if node == nil { return }
            dict[count, default: [Int]()].append(node!.val)
            recursive(node?.left, count: count+1)
            recursive(node?.right, count: count+1)
        }
        recursive(root, count: 1)
        return dict.sorted(by: { $0.key < $1.key }).map { (element) -> [Int] in
            return element.value
        }
    }
}
```



#### BFS

```swift
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        var queue = [root]
        
        while !queue.isEmpty {
            var level = [Int]()
            for _ in 0..<queue.count {
                let e = queue.removeFirst()
                if let e = e {
                    level.append(e.val)
                    queue.append(e.left)
                    queue.append(e.right)
                }
            }
            if !level.isEmpty { result.append(level) }
        }
        return result
    }
}
```





### Hong이 발견한 신박한 풀이!

```swift
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    var q = [TreeNode]()
    var lists = [[Int]]()
    q.append(root)
    
    while !q.isEmpty {
        lists.append(q.map { $0.val })
        print(lists, "list")
        q = q.reduce([]) { l, t in
            l + [t.left, t.right] // [] + [2,2] = [2,2]
        }.compactMap({$0})
        print(q)
    }
    return lists
}
var tlal = TreeNode(3, TreeNode(2, TreeNode(10), TreeNode(10)), TreeNode(2, TreeNode(10), TreeNode(10)))
levelOrder(tlal)

/*
[[3]] list
[TestTest.TreeNode, TestTest.TreeNode]
[[3], [2, 2]] list
[TestTest.TreeNode, TestTest.TreeNode, TestTest.TreeNode, TestTest.TreeNode]
[[3], [2, 2], [10, 10, 10, 10]] list
[]
*/
```

