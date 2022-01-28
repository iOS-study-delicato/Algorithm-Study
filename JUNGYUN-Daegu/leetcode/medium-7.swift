// LeetCode Medium 7. Reverse Integer
// https://leetcode.com/problems/reverse-integer/
// 22.01.28

class Solution {
    func reverse(_ x: Int) -> Int {
        var num = abs(x)
        let sign = x < 0 ? -1 : 1
         
        var limit: [String] = []
        
        if sign == -1 {
            // notice when you initialize minus int into string, "-" will be taken into account
            limit = String(Int32.min).dropFirst().map { String($0) }
        } else {
            limit = String(Int32.max).map { String($0) }
        }
        
        
        var board: [String] = []
        
        
        while num > 0 {
            board.append(String(num % 10))
            num = num / 10
        }
        
        
        while board.count > 0 && board.first! == "0" {
            board.removeFirst()
        }
        
        
        guard board.count > 0 else { return 0 }
        
        
        if board.count > limit.count {
            return 0
        } else if board.count < limit.count {
            return Int(board.joined())! * sign
        } else {
            for i in 0..<board.count {
                if Int(limit[i])! < Int(board[i])! {
                    return 0
                } else if Int(limit[i])! > Int(board[i])! {
                    return Int(board.joined())! * sign
                }
            }
        }
        
        
        return 0
    }
}

