// LeetCode Medium 33. Search in Rotated Sorted Array
// https://leetcode.com/problems/search-in-rotated-sorted-array/
// 22.02.08

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var result = -1
        
        var left = 0
        var right = nums.count - 1

        while left <= right {
            let mid = left + ((right - left) / 2)
            
            if nums[mid] == target {
                result = mid
                break
            } else if nums[mid] < target {
                if nums[right] >= nums[mid] && nums[right] < target {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                if nums[left] <= nums[mid] && nums[left] > target {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }

        return result
    }
}

