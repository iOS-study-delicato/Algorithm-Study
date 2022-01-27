// LeetCode Medium 4. Median of Two Sorted Arrays
// https://leetcode.com/problems/median-of-two-sorted-arrays/
// 22.01.27

class Solution {
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        // always set nums1 as smaller or same size
        if nums1.count > nums2.count {
            return findMedianSortedArrays(nums2, nums1)
        }
        
        let x = nums1.count
        let y = nums2.count
        
        var low = 0
        var high = x
        
        while low <= high {
            let partitionX = (low + high) / 2
            // add 1 to make it easier to calculate half
            // remember always one more element in the leftside
            let partitionY = ((x + y + 1) / 2) - partitionX
            
            //if partitionX is 0 it means nothing is there on left side, Use -INF for maxLeftX
            //if partitionX is length of input, there is nothing on right side. Use +INF for maxRightX
            let maxLeftX = (partitionX == 0) ? Int.min : nums1[partitionX - 1]
            let minRightX = (partitionX == x) ? Int.max : nums1[partitionX]
            
            let maxLeftY = (partitionY == 0) ? Int.min : nums2[partitionY - 1]
            let minRightY = (partitionY == y) ? Int.max : nums2[partitionY]
            
            if maxLeftX <= minRightY && maxLeftY <= minRightX {
                //We have partitioned array at correct place
                //Now get max of left elements and min of right elements to get the median in case of even length combined array size
                if (x + y) % 2 == 0 {
                    return Double(max(maxLeftX, maxLeftY) + min(minRightX, minRightY)) / 2
                } else {
                    return Double(max(maxLeftX, maxLeftY))
                }
            } else if (maxLeftX > minRightY) {
                high = partitionX - 1
            } else {
                low = partitionX + 1
            }
        }
        return 0
    }
    
}


