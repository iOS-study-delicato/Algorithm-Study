// LeetCode 58. Length of Last Word
// https://leetcode.com/problems/length-of-last-word/
// 22.03.15

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let s = s.split(separator: " ")
        return s.last!.count
    }
}

