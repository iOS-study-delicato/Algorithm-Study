// LeetCode Easy 69. Sqrt(x)
// https://leetcode.com/problems/sqrtx/
// 22.02.22 

//this solution can be improved by binary search
class Solution {
    func mySqrt(_ x: Int) -> Int {
        guard x > 0 else { return 0 }
        
        for i in 1..<x {
            let val = i * i
            
            if val > x {
                return i - 1
            }
        }
        
        return 1
    }
}

