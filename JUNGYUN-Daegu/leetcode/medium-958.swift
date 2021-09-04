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
 func isCompleteTree(_ root: TreeNode?) -> Bool {
        var queue: [TreeNode] = []
        
        guard let safeRoot = root else { return false }
        queue.append(safeRoot)
        
        repeat {
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                
                if node.left != nil && node.right != nil {
                    queue.append(node.left!)
                    queue.append(node.right!)
                } else if node.left != nil && node.right == nil {
                    queue.append(node.left!)
                    if areLastLevelNodes(nodes: queue) {
                        return true
                    } else {
                        return false
                    }
                } else if node.left == nil && node.right != nil {
                    return false
                } else { // 둘다 nil인 경우
                    if !areLastLevelNodes(nodes: queue) {
                        return false
                    }
                }
            }
        } while !queue.isEmpty
        
        return true
    }
    
    func areLastLevelNodes(nodes: [TreeNode]) -> Bool {
        var result = true
        
        nodes.forEach { (node) in
            if node.left != nil || node.right != nil {
                result = false
            }
        }
        return result
    }
}
