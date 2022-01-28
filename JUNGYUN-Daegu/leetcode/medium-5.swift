// LeetCode Medium 5. Longest Palindromic Substring
// https://leetcode.com/problems/longest-palindromic-substring/
// 22.01.27

class Solution {
    func longestPalindrome(_ s: String) -> String {
        let s = s.map { $0 }
        var currentLongestPalindromeLen: Int = 0
        
        var leftPnt: Int = 0
        var rightPnt: Int = 0
        
        func expandAround(center: Int, isIntegerIndex: Bool) {
            var low: Int = 0
            var high: Int = 0
            
            if isIntegerIndex {
                low = center
                high = center
            } else {
                low = center - 1
                high = center
            }
            
            while low >= 0 && high < s.count && s[low] == s[high] {
                if high - low + 1 > currentLongestPalindromeLen {
                    currentLongestPalindromeLen = high - low + 1
                    
                    leftPnt = low
                    rightPnt = high
                }
                
                low -= 1
                high += 1
            }
        }
        
        for i in 0..<s.count {
            expandAround(center: i, isIntegerIndex: true)
            expandAround(center: i, isIntegerIndex: false)
        }
        
        return s[leftPnt...rightPnt].map { String($0) }.joined()
    }
}


