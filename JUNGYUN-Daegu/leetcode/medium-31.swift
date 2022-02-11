// LeetCode Medium 31. Next Permutation
// https://leetcode.com/problems/next-permutation/
// 22.02.07

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        
        var i: Int = -1
        var j: Int = nums.count - 1
        
        ///1.Find the position: Scan the array from right to left and find a decreasing point
        for k in stride(from: nums.count - 1, through: 1, by: -1) {
            if nums[k] > nums[k - 1] {
                i = k - 1
                break
            }
        }
        
        if i == -1 {
            nums = nums.reversed()
            return
        }
        
        ///2. Find the subtitute: Scan the array from right to left find the next highest after the number found above
        for l in stride(from: nums.count - 1, through: i + 1, by: -1) {
            if nums[i] < nums[l] {
                j = l
                break
            }
        }
        
        nums.swapAt(i, j)
        
        ///3. Rearrange remaining numbers: Now, reverse the array from index + 1 until the end of the array. (You can use sort function too to make )
        nums[(i + 1)...].reverse()
    }
}
