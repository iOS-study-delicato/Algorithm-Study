// LeetCode 15. 3Sum
// https://leetcode.com/problems/3sum/
// 22.01.30

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sorted = nums.sorted()
        var result: Set<[Int]> = []
        
        for start in 0..<sorted.count {
            var mid = start + 1
            var end = sorted.count - 1
            
            while mid < end {
                let sum = sorted[start] + sorted[mid] + sorted[end]
                
                if sum == 0 {
                    result.insert([sorted[start], sorted[mid], sorted[end]])
                    
                    let currentEnd = sorted[end]
                    
                    while sorted[end] == currentEnd && end > 0 {
                        end -= 1
                    }
                    
                } else if sum < 0 {
                    let currentMid = sorted[mid]
                    
                    while sorted[mid] == currentMid && mid < end {
                        mid += 1
                    }
                    
                } else {
                    let currentEnd = sorted[end]
                    
                    while sorted[end] == currentEnd && end > 0 {
                        end -= 1
                    }
                }
            }
        }
        return Array(result)
    }
}

