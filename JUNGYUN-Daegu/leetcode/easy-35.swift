// LeetCode Easy 35. Search Insert Position
// https://leetcode.com/problems/search-insert-position/
// 22.01.25

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    
        func binarySearch(start: Int, end: Int) -> Int {
            
            print(start, end)
            if end - start < 2 {
                if target <= nums[start] {
                    return start
                } else if target < nums[end] {
                    return start + 1
                } else if target == nums[end] {
                    return end
                } else {
                    return end + 1
                }
            }
            
            let mid = start + ((end - start) / 2)
            
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                return binarySearch(start: start, end: mid - 1)
            } else {
                return binarySearch(start: mid + 1, end: end)
            }
            
        }
        
        return binarySearch(start: 0, end: nums.count - 1)
    }
}

