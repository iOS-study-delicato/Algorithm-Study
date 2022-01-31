// LeetCode Meidum 16. 3Sum Closest
// https://leetcode.com/problems/3sum-closest/
// 22.01.31

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sorted = nums.sorted()
        var currentClosestSum = Int.max
        var currentDiff = Int.max
        
        for start in 0..<nums.count {
            var mid = start + 1
            var end = nums.count - 1
            
            while mid < end {
                let sum = (sorted[start] + sorted[mid] + sorted[end])
                var diff: Int = 0
                
                if sum * target > 0 {
                    diff = abs(sum - target)
                } else {
                    diff = abs(sum) + abs(target)
                }
                
                if currentDiff > diff {
                    currentClosestSum = sum
                    currentDiff = diff
                }
                
                if sum < target {
                    
                    let currentMid = sorted[mid]
                    while mid < sorted.count && currentMid == sorted[mid] {
                        mid += 1
                    }
                    
                } else if sum > target {
                    
                    let currentEnd = sorted[end]
                    while end > 0 && currentEnd == sorted[end] {
                        end -= 1
                    }
                    
                } else {
                    break
                }
            }
        }
        
        return currentClosestSum
    }
}
