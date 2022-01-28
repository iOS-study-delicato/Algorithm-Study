// LeetCode Easy 1. Two Sum
// https://leetcode.com/problems/two-sum/
// 22.01.26

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let sorted = nums.enumerated().sorted { $0.element < $1.element }
        
        var start: Int = 0
        var end: Int = sorted.count - 1
        
        var result: [Int] = []
        
        while start < end {
            let sum = sorted[start].element + sorted[end].element
            
            if sum == target {
                result = [sorted[start].offset, sorted[end].offset]
                break
            } else if sum < target {
                start += 1
            } else {
                end -= 1
            }
        }
        
        return result
    }
}

