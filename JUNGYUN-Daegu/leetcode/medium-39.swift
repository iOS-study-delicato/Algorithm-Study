// LeetCode Medium 39. Combination Sum
// https://leetcode.com/problems/combination-sum/
// 22.02.14

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
    
        func dfs(start: Int, picked: [Int], sum: Int) {
            if sum == target {
                result.append(picked)
                return
            } else if sum > target {
                return
            }
            
            for i in start..<candidates.count {
                var newPick = picked
                newPick.append(candidates[i])
                dfs(start: i, picked: newPick, sum: sum + candidates[i])
            }
        }
        
        for i in 0..<candidates.count {
            dfs(start: i, picked: [candidates[i]], sum: candidates[i])
        }
        
        return result
    }
}

