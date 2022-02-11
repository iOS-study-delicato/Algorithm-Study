// LeetCode 34. Find First and Last Position of Element in Sorted Array
// https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
// 22.02.09

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 0 else { return [-1, -1]}
        var indices = [Int]()
        
        var left = 0
        var right = nums.count - 1
        
        //find first
        while left <= right {
            let mid = left + ((right - left) / 2)
            
            if nums[mid] == target {
                indices.append(mid)
                break
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        guard !indices.isEmpty else { return [-1, -1] }
        
        let pivot = indices.first!
        
        //searching head
        if pivot > 0 && nums[pivot - 1] == target {
            var headIndex = -1
            left = 0
            right = pivot - 1
            
            while left <= right {
                let mid = left + ((right - left) / 2)
                
                if nums[mid] == target {
                    headIndex = mid
                    
                    if mid > 0 && nums[mid - 1] == target {
                        right = mid - 1
                    } else {
                        break
                    }
                    
                } else {
                    left = mid + 1
                }
            }
            
            indices.append(headIndex)
        }
        
        // searching tail
        if pivot < nums.count - 1 && nums[pivot + 1] == target {
            var tailIndex = -1
            
            left = pivot + 1
            right = nums.count - 1
            
            while left <= right {
                let mid = left + ((right - left) / 2)
                
                if nums[mid] == target {
                    tailIndex = mid
                    
                    if mid < nums.count - 1 && nums[mid + 1] == target {
                        left = mid + 1
                    } else {
                        break
                    }
                    
                } else {
                    right = mid - 1
                }
            }
            
            indices.append(tailIndex)
        }
        
        indices = indices.filter({ $0 != -1 }).sorted()
        
        return [indices.first!, indices.last!]
    }
}

