// LeetCode Easy 941. Valid Mountain Array
// https://leetcode.com/problems/valid-mountain-array/
// 22.01.25

class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        let maxIndex = arr.firstIndex(of: arr.max()! )!
        
        if maxIndex == arr.count - 1 || maxIndex == 0 {
            return false
        }
        
        for lhs in stride(from: maxIndex - 1, through: 0, by: -1) {
            if arr[lhs] >= arr[lhs + 1] {
                return false
            }
        }
        
        for rhs in maxIndex + 1..<arr.count {
            if arr[rhs] >= arr[rhs - 1] {
                return false
            }
        }
        
        return true
    }
}

