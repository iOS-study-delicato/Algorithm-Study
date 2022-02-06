// LeetCode Hard 30. Substring with Concatenation of All Words
// https://leetcode.com/problems/substring-with-concatenation-of-all-words/
// 22.02.06

class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        let s = s.map { $0 }
        var dict: [String: Int] = [:]
        let windowSize = words[0].count * words.count
        
        guard s.count > 0 && windowSize > 0 else { return [] }
        
        for word in words {
            if dict[word] == nil {
                dict[word] = 1
            } else {
                dict[word]! += 1
            }
        }
        
        var result: [Int] = []
        var start = 0
        var end = start + windowSize - 1
        
        while end < s.count {
            var wordCount = words.count
            var tempDict = dict
            var word = ""
            
            for i in start...end {
                word.append(s[i])
                
                if tempDict[word] != nil && tempDict[word]! != 0 {
                    tempDict[word]! -= 1
                    wordCount -= 1
                    word = ""
                }
                
                if word.count > words[0].count {
                    break
                }
            }
            
            if wordCount == 0 {
                result.append(start)
            }
            
            start += 1
            end += 1
        }
        
        return result
    }
}

