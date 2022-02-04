// LeetCode Meidum 22. Generate Parentheses
// https://leetcode.com/problems/generate-parentheses/
// 22.02.01

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []
        
        func DFS(opening: Int, closing: Int, parentheses: String) {
            if opening == n && closing == n {
                result.append(parentheses)
                return
            }
            
            if opening == closing {
                var new = parentheses
                new.append("(")
                DFS(opening: opening + 1, closing: closing, parentheses: new)
            } else {
                if opening < n {
                    var new = parentheses
                    new.append("(")
                    DFS(opening: opening + 1, closing: closing, parentheses: new)
                }
                
                if closing < n {
                    var new = parentheses
                    new.append(")")
                    DFS(opening: opening, closing: closing + 1, parentheses: new)
                }
            }
            
        }
        
        DFS(opening: 1, closing: 0, parentheses: "(")
        
        return result
    }
}

