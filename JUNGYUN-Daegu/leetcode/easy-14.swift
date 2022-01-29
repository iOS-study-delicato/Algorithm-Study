// LeetCode 14. Longest Common Prefix
// https://leetcode.com/problems/longest-common-prefix/
// 22.01.29

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        let strs = strs.map { $0.map { $0 } }
        
        var result: String = ""
        
        let shortest = strs.min { $0.count <= $1.count }!.count
        var i: Int = 0
        
        while i < shortest {
            var temp: String = String(strs[0][i])
            
            for j in 1..<strs.count {
                if temp == String(strs[j][i]) {
                    continue
                } else {
                    temp = ""
                    i = Int.max - 1
                    break
                }
            }
            
            result.append(temp)
            i += 1
        }
        
        return result
    }
}


