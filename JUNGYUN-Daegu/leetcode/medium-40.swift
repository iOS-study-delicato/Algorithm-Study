// LeetCode Medium 40. Combination Sum II
// https://leetcode.com/problems/combination-sum-ii/
// 22.02.15

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = Set<Array<Int>>()
        let sorted = candidates.sorted()

        func dfs(start: Int, picked: [Int], k: Int) {
            
            if k == 0 {
                result.insert(picked)
                return
            } else if k < 0 {
                return
            }
            
            for i in start..<sorted.count {
                if i != start && sorted[i] == sorted[i - 1] { continue }
                if sorted[i] > target { break }
                
                var newlyPicked = picked
                newlyPicked.append(sorted[i])
                dfs(start: i + 1, picked: newlyPicked, k: k - sorted[i])
            }
        }
        
        dfs(start: 0, picked: [], k: target)
        
        return Array(result)
    }
}


