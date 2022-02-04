// LeetCode Easy 26. Remove Duplicates from Sorted Array
// https://leetcode.com/problems/remove-duplicates-from-sorted-array/
// 22.02.04

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        guard nums.count > 0 else { return 0 }

        for i in stride(from: nums.count - 1, through: 1, by: -1) {
            if nums[i] == nums[i - 1] {
                let _ = nums.remove(at: i)
            }
        }
        
        return nums.count
    }
}

