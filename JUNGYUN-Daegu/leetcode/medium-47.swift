// Leetcode > 47. Permutations II
// https://leetcode.com/problems/permutations-ii/
// 22.03.02

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var visited = Array(repeating: false, count: nums.count)
        var result: Set<[Int]> = []
        
        func dfs(picked: [Int], depth: Int) {
            if depth == nums.count {
                if picked.count == nums.count {
                    result.insert(picked)
                }
                return
            }
            
            for i in 0..<nums.count {
                if visited[i] {
                    continue
                }
                
                visited[i] = true
                var newlyPicked = picked
                newlyPicked.append(nums[i])
                dfs(picked: newlyPicked, depth: depth + 1)
                visited[i] = false
            }
        }
        
        dfs(picked: [], depth: 0)
        
        return Array(result)
    }
}
