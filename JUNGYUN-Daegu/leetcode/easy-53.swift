// LeetCode 53. Maximum Subarray
// https://leetcode.com/problems/maximum-subarray/
// 22.02.12

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maximumSum: Int = Int.min
        var currentSum: Int = 0
        
        for i in 0..<nums.count {
            currentSum += nums[i]
            
            maximumSum = max(maximumSum, currentSum)
            
            if currentSum < 0 {
                currentSum = 0
            }
        }
            
        return maximumSum
    }
}

