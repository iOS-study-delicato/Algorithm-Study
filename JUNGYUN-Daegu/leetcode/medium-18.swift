// LeetCode Meidum 18. 4Sum
// https://leetcode.com/problems/4sum/
// 22.02.01

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let sorted = nums.sorted()
        var result: Set<[Int]> = []
        
        guard sorted.count > 3 else { return Array(result) }
        
        for start1 in 0..<sorted.count - 3 {
            for start2 in start1 + 1..<sorted.count - 2 {
                var mid = start2 + 1
                var end = sorted.count - 1
                
                while mid < end {
                    let sum = sorted[start1] + sorted[start2] + sorted[mid] + sorted[end]
                    
                    if sum < target {
                        let currentMid = sorted[mid]
                        
                        while mid < sorted.count && currentMid == sorted[mid] {
                            mid += 1
                        }
                    } else if sum > target {
                        let currentEnd = sorted[end]
                        
                        while end >= 0 && currentEnd == sorted[end] {
                            end -= 1
                        }
                    } else {
                        result.insert([sorted[start1], sorted[start2], sorted[mid], sorted[end]])
                        
                        let currentMid = sorted[mid]
                        
                        while mid < sorted.count && currentMid == sorted[mid] {
                            mid += 1
                        }
                    }
                }
            }
        }
        return Array(result)
    }
}
