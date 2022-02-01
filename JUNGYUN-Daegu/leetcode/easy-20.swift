class Solution {
    func isValid(_ s: String) -> Bool {
        let parentheses: [Character: Character] = ["(":")",
                                                  "{":"}",
                                                   "[":"]"]
        var stack: [Character] = []
        
        for char in s {
            if parentheses[char] != nil {
                stack.append(char)
            } else {
                if let last = stack.popLast() {
                    if parentheses[last] == char {
                        continue
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            }
        }
        
        return stack.count == 0
    }
}

