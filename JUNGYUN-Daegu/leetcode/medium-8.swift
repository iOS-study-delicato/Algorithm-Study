// LeetCode Medium 8. String to Integer (atoi)
// https://leetcode.com/problems/string-to-integer-atoi/
// 22.01.28

class Solution {
    func myAtoi(_ s: String) -> Int {
        var characters = s.map { $0 }
        // to make easier to cut front
        characters = characters.reversed()
        var sign = 1
        
        while characters.count > 0 && characters.last!.isWhitespace {
            characters.removeLast()
        }
        
        guard characters.count > 0 else { return 0 }
        
        if characters.last! == "-" {
            sign = -1
            characters.removeLast()
        } else if characters.last! == "+" {
            characters.removeLast()
        }
        
        var board: [Character] = []
        
        for i in stride(from: characters.count - 1, through: 0, by: -1) {
            if characters[i].isASCII && characters[i].isNumber {
                if characters[i] == "0" && board.count == 0 {
                    continue
                } else {
                    board.append(characters[i])
                }
            } else {
                break
            }
        }
        
        guard board.count > 0 else { return 0 }
        
        var limit: [Character] = []
        // clamping to limit
        if sign == 1 {
            limit = String(Int32.max).map { $0 }
        } else {
            limit = String(Int32.min).dropFirst().map { $0 }
        }
        
        if board.count > limit.count {
            return Int(limit.map { String($0) }.joined())! * sign
        } else if board.count == limit.count {
            for i in 0..<limit.count {
                if limit[i] < board[i] {
                    return Int(limit.map { String($0) }.joined())! * sign
                } else if limit[i] > board[i] {
                    return Int(board.map { String($0) }.joined())! * sign
                }
            }
            return Int(board.map { String($0) }.joined())! * sign
        } else {
            return Int(board.map { String($0) }.joined())! * sign
        }
    }
}
