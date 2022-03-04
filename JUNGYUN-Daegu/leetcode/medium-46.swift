// LeetCode 46. Permutations
// https://leetcode.com/problems/permutations/
// 22.02.25

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var visited = Array(repeating: false, count: nums.count)
        var result: [[Int]] = []

        func dfs(picked: [Int], depth: Int) {
            
            if depth >= nums.count {
                if picked.count == nums.count {
                    result.append(picked)
                }
                return
            }
            
            for i in 0..<nums.count {
                if visited[i] {
                    continue
                } else {
                    var newlyPicked = picked
                    newlyPicked.append(nums[i])
                    visited[i] = true
                    dfs(picked: newlyPicked, depth: depth + 1)
                    visited[i] = false
                }
            }
        }
        
        dfs(picked: [], depth: 0)
        
        return result
    }
}
