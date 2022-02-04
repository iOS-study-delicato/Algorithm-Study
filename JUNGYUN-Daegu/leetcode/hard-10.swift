// LeetCode 10. Regular Expression Matching
// https://leetcode.com/problems/regular-expression-matching/
// 22.01.29

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let s = s.map { $0 }
        let p = p.map { $0 }
    
        func validate(i: Int, j: Int) -> Bool {
            if j == p.count { return i == s.count }
            
            let isCurrentMatching = i != s.count && (s[i] == p[j] || p[j] == ".")
            
            if j < p.count - 1 && p[j + 1] == "*" {
                return (isCurrentMatching && validate(i: i + 1, j: j)) || validate(i: i, j: j + 2)
            } else {
                return isCurrentMatching && validate(i: i + 1, j: j + 1)
            }
        }
        
        return validate(i: 0, j: 0)
    }
}
    
