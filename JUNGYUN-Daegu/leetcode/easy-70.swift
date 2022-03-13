// LeetCode 70. Climbing Stairs
// https://leetcode.com/problems/climbing-stairs/
// 22.03.13

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        
        for i in 1...n {
            dp[i] = dp[i - 1]
        
            if i > 1 {
                dp[i] += dp[i - 2]
            }
        }

        return dp[n]
    }
}

