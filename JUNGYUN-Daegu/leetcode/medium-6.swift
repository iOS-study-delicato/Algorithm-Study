// LeetCode Medium 6. Zigzag Conversion
// https://leetcode.com/problems/zigzag-conversion/
// 22.01.27

class Solution {
    
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        
        var board: [String] = Array(repeating: "", count: numRows)
        
        var moveDown = false
        var row: Int = 0
        
        for char in s {
            board[row] += String(char)
            
            if moveDown {
                if row + 1 < board.count {
                    row += 1
                } else {
                    moveDown = false
                    row -= 1
                }
                
            } else {
                if row - 1 >= 0 {
                    row -= 1
                } else {
                    row += 1
                    moveDown = true
                }
            }
        }
        
        var result = ""
        
        for row in board {
            result += row
        }
        
        return result
    }
}

