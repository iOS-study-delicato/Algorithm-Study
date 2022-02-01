// LeetCode Meidum 17. Letter Combinations of a Phone Number
// https://leetcode.com/problems/letter-combinations-of-a-phone-number/
// 22.02.01

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let digits = digits.map { $0 }
        let dict: [Character: [Character]] = ["2": ["a", "b", "c"],
                                              "3": ["d", "e", "f"],
                                              "4": ["g", "h", "i"],
                                              "5": ["j", "k", "l"],
                                              "6": ["m", "n", "o"],
                                              "7": ["p", "q", "r", "s"],
                                              "8": ["t", "u", "v"],
                                              "9": ["w", "x", "y", "z"]]
        var result: [String] = []
        
        guard digits.count > 0 else { return result }
        
        func DFS(str: String) {
            if str.count == digits.count {
                result.append(str)
                return
            }
            
            let index = str.count
            let digit = digits[index]
            
            for letter in dict[digit]! {
                DFS(str: "\(str)\(letter)")
            }
        }
        
        DFS(str: "")
        
        return result
    }
}
