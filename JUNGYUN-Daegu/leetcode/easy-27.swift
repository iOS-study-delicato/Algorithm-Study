// LeetCode Easy 27. Remove Element
// https://leetcode.com/problems/remove-element/
// 22.02.04

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        guard nums.count > 0 else { return 0 }

        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            if nums[i] == val {
                let _ = nums.remove(at: i)
            }
        }
        
        return nums.count
    }
}

