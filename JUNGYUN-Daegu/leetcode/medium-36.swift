// LeetCode Medium 36. Valid Sudoku
// https://leetcode.com/problems/valid-sudoku/
// 22.02.09

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        let digits: Set<Character> = ["1","2","3","4","5","6","7","8","9"]
        
        // check rows
        for i in 0..<board.count {
            var tempDigits = digits
            for j in 0..<board[0].count {
                guard board[i][j] != "." else { continue }
                if let _ = tempDigits.remove(board[i][j]) {
                    continue
                } else {
                    return false
                }
            }
        }
        
        // check columns
        for k in 0..<board.count {
            var tempDigits = digits
            for l in 0..<board[0].count {
                guard board[l][k] != "." else { continue }
                if let _ = tempDigits.remove(board[l][k]) {
                    continue
                } else {
                    return false
                }
            }
        }
        
        let size = 3
        
        // check smaller boxes
        for n in 0...2 {
            for m in 0...2 {
                let x = n * 3
                let y = m * 3
                var tempDigits = digits
                
                for row in y..<y + size {
                    for column in x..<x + size {
                        guard board[row][column] != "." else { continue }
                        if let _ = tempDigits.remove(board[row][column]) {
                            continue
                        } else {
                            return false
                        }
                    }
                }
            }
        }
        
        return true
    }
}

