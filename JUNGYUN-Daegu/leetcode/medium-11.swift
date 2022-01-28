// LeetCode 11. Container With Most Water
// https://leetcode.com/problems/container-with-most-water/
// 22.01.24

class Solution {
    
    func maxArea(_ height: [Int]) -> Int {
        var currentMaxArea: Int = 0
        
        var left: Int = 0
        var right: Int = height.count - 1
        
        while left < right {
            currentMaxArea = max(currentMaxArea, (right - left) * min(height[left], height[right]))
            
            if height[left] > height[right] {
                right -= 1
            } else {
                left += 1
            }
        }

        return currentMaxArea
    }

}

