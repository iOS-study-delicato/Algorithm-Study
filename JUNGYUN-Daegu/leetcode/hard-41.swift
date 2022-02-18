// LeetCode 41. First Missing Positive
// https://leetcode.com/problems/first-missing-positive/
// 22.02.18

class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let numSet = Set(nums)
        
        var ans = 1
        
        while numSet.contains(ans) {
            ans += 1
        }
        
        return ans
    }
}

