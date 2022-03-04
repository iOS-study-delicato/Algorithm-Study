// LeetCode Medium 45. Jump Game II
// https://leetcode.com/problems/jump-game-ii/
// 22.02.23

class Solution {
    // DP Solution N^2
    func jump(_ nums: [Int]) -> Int {
        var dp = Array(repeating: Int.max, count: nums.count)
        dp[0] = 0
        
        for i in 0..<nums.count {
            guard nums[i] > 0 else { continue }
            for j in 1...nums[i] {
                guard i + j < nums.count else { break }
                guard dp[i] != Int.max else { continue }
                dp[i + j] = min(dp[i] + 1, dp[i + j])
            }
        }
        
        return dp[nums.count - 1]
    }
    
    // Linear Solution
    func jump(_ nums: [Int]) -> Int {
        var currentJump = 0
        var currentEnd = 0
        var farestPosition = -1
        
        for i in 0..<nums.count - 1 {
            
            if farestPosition < i + nums[i] {
                if i + nums[i] >= nums.count {
                    farestPosition = Int.max
                } else {
                    farestPosition = max(i + nums[i], farestPosition)
                }
            }
            
            if i == currentEnd {
                currentJump += 1
                currentEnd = farestPosition
            }
        }
        
        return currentJump
    }
}

