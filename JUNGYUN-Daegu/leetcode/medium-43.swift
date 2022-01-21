// LeetCode Medium 43 Multiply Strings
// https://leetcode.com/problems/multiply-strings/
// 22.01.17

import Foundation

class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        let num1Array = num1.map { Int(String($0))! }.reversed()
        let num2Array = num2.map { Int(String($0))! }.reversed()
    
        var board: [String] = ["0"]

        func add(at idx: Int, by num: Int) {
            guard num != 0 else { return }
            
            while board.count <= idx {
                board.append("0")
            }
            
            let temp = Int(board[idx])! + num
    
            board[idx] = String(temp % 10)
            add(at: idx + 1, by: (temp / 10))
        }

        for (idxI, i) in num1Array.enumerated() {
            for (idxJ, j) in num2Array.enumerated() {
                
                let tempResult = i * j
                let index = idxI + idxJ
                
                add(at: index, by: tempResult % 10)
                add(at: index + 1, by: (tempResult / 10))
            }
        }
        
        return board.reversed().joined()
    }
}

