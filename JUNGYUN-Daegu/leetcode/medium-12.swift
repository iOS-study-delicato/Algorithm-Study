// LeetCode 12. Integer to Roman
// https://leetcode.com/problems/integer-to-roman/
// 22.01.29

class Solution {
    func intToRoman(_ num: Int) -> String {
        let dict: [String: Int] = ["I": 1,
                                   "V": 5,
                                   "X": 10,
                                   "L": 50,
                                   "C": 100,
                                   "D": 500,
                                   "M": 1000]
        
        var board: String = ""
        var num = num
        
        while num > 0 {
            if num - dict["M"]! >= 0 {
                num -= dict["M"]!
                board.append("M")
            } else if num - (dict["M"]! - dict["C"]!) >= 0 {
                num -= (dict["M"]! - dict["C"]!)
                board.append("CM")
            } else if num - dict["D"]! >= 0 {
                num -= dict["D"]!
                board.append("D")
            } else if num - (dict["D"]! - dict["C"]!) >= 0 {
                num -= (dict["D"]! - dict["C"]!)
                board.append("CD")
            } else if num - dict["C"]! >= 0 {
                num -= dict["C"]!
                board.append("C")
            } else if num - (dict["C"]! - dict["X"]!) >= 0 {
                num -= (dict["C"]! - dict["X"]!)
                board.append("XC")
            } else if num - dict["L"]! >= 0 {
                num -= dict["L"]!
                board.append("L")
            } else if num - (dict["L"]! - dict["X"]!) >= 0 {
                num -= (dict["L"]! - dict["X"]!)
                board.append("XL")
            } else if num - dict["X"]! >= 0 {
                num -= dict["X"]!
                board.append("X")
            } else if num - (dict["X"]! - dict["I"]!) >= 0 {
                num -= (dict["X"]! - dict["I"]!)
                board.append("IX")
            } else if num - dict["V"]! >= 0 {
                num -= dict["V"]!
                board.append("V")
            } else if num - (dict["V"]! - dict["I"]!) >= 0 {
                num -= (dict["V"]! - dict["I"]!)
                board.append("IV")
            } else if num - dict["I"]! >= 0 {
                num -= dict["I"]!
                board.append("I")
            }
        }
        return board
    }
}
