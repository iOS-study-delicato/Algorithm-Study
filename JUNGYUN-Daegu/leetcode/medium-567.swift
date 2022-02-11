// LeetCode Medium 567. Permutation in String
// https://leetcode.com/problems/permutation-in-string/
// 22.02.11

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        guard s1.count <= s2.count else { return false }
        let s2 = s2.map{ $0 }
        let size = s1.count
        var start: Int = 0
        var end: Int = start + size - 1
        var dict: Dictionary<Character, Int> = [:]
        
        for char in s1 {
            if dict[char] == nil {
                dict[char] = 1
            } else {
                dict[char]! += 1
            }
        }
        
        var result = true
        
        while end < s2.count {
            var tempDict = dict
            result = true
            
            for i in start...end {
                if tempDict[s2[i]] != nil && tempDict[s2[i]]! > 0 {
                    tempDict[s2[i]]! -= 1
                } else {
                    start += 1
                    end += 1
                    result = false
                    break
                }
            }
            
            if result == true {
                break
            }
        }
        
        return result
    }
}


