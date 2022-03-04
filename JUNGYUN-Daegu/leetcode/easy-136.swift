// LeetCode Easy 136. Single Number
// https://leetcode.com/problems/single-number/
// 22.02.21


class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        let distinctNums = Set(nums)

        return distinctNums.reduce(0, +) * 2 - nums.reduce(0, +)
    }
}
