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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let safeRoot = root else { return [] }
        var result: [[Int]] = []
        var queue: [TreeNode] = [safeRoot]
        
        while queue.count != 0 {
            var tempArray: [Int] = []
            for _ in 0..<queue.count {
                            // 현재레벨 처리
                let node = queue.removeFirst()
                tempArray.append(node.val)
             // 다음 레벨 큐에 추가
                if node.left != nil && node.right != nil {
                    queue.append(node.left!)
                    queue.append(node.right!)
                } else if node.left != nil && node.right == nil {
                    queue.append(node.left!)
                } else if node.left == nil && node.right != nil {
                    queue.append(node.right!)
                }
            }
            result.append(tempArray)
        }
        return result
    }
}
