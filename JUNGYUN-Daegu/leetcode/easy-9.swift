// LeetCode Easy 9. Palindrome Number
// https://leetcode.com/problems/palindrome-number/
// 22.01.28

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let number = String(x).map { $0 }
        
        if number.first! == "-" {
            return false
        }
        
        var start = 0
        var end = 0
        
        if number.count % 2 == 0 {
            start = (number.count / 2) - 1
            end = (number.count / 2)
        } else {
            start = (number.count) / 2
            end = (number.count) / 2
        }
        
        //expand around center
        while start >= 0 && end < number.count && number[start] == number[end] {
            start -= 1
            end += 1
        }
        
        if start == -1 && end == number.count {
            return true
        } else {
            return false
        }
        
    }
}
