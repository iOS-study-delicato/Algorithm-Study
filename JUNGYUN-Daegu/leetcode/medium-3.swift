
// LeetCode Medium 3. Longest Substring Without Repeating Characters
// https://leetcode.com/problems/longest-substring-without-repeating-characters/
// 22.01.27

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var currentLongest: Int = 0
        
        var dict: [Character: Int] = [:]
        var start = 0
        var end = 0
        
        if s.count == 0 { return 0 }
        
        for (i, char) in s.enumerated() {
            if dict[char] == nil || (dict[char] != nil && dict[char]! < start) {
                dict[char] = i
            } else {
                let length = end - start + 1
                currentLongest = length > currentLongest ? length : currentLongest
                start = dict[char]! + 1
                dict[char] = i
            }
            end = i
        }
        
        let length = end - start + 1
        currentLongest = length > currentLongest ? length : currentLongest
        
        return currentLongest
    }
}

