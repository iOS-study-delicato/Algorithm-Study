// LeetCode Hard 32. Longest Valid Parentheses
// https://leetcode.com/problems/longest-valid-parentheses/
// 22.02.08

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        let s = s.map { $0 }
        var result: Int = 0
        var start: Int = 0
        var stack: [Int] = []
        
        for (index, p) in s.enumerated() {
            if p == "(" {
                stack.append(index)
            } else {
                if !stack.isEmpty {
                    stack.removeLast()
                    if let last = stack.last {
                        result = max(result, index - last)
                    } else {
                        result = max(result, index - start + 1)
                    }
                } else {
                    start = index + 1
                }
            }
        }
        
        return result
    }
}

