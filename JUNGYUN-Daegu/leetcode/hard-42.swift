// LeetCode Hard 42. Trapping Rain Water
// https://leetcode.com/problems/trapping-rain-water/
// 22.01.24

class Solution {
    
    var lefttMax: Int = 0
    var rightMax: Int = 0
    
    func trap(_ height: [Int]) -> Int {
        var maximumHeight: Int = 0
        var maximumHeightIndex: Int = 0
        
        // set maximum height index
        for (i, v) in height.enumerated() {
            if v > maximumHeight {
                maximumHeightIndex = i
                maximumHeight = v
            }
        }
        
        var left: Int = 0
        var leftMax: Int = 0
        var right: Int = height.count - 1
        var rightMax: Int = 0
        
        var result: Int = 0
        
        while left < maximumHeightIndex {
            leftMax = height[left] >= leftMax ? height[left] : leftMax
            
            result += leftMax - height[left]
            left += 1
        }
        
        while right > maximumHeightIndex {
            rightMax = height[right] >= rightMax ? height[right] : rightMax
            
            result += rightMax - height[right]
            right -= 1
        }
        
        return result
    }
}

