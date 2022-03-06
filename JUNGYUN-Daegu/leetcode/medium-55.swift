// LeetCode Medium 55. Jump Game
// https://leetcode.com/problems/jump-game/
// 22.03.06

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var maxReachableIndex = 0
        
        for (index, num) in nums.enumerated() {
            if index > maxReachableIndex {
                break
            }
            
            maxReachableIndex = max(maxReachableIndex, index + num)
            
            if maxReachableIndex >= nums.count - 1 {
                break
            }
        }
        
        return maxReachableIndex >= nums.count - 1
    }
}

