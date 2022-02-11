// LeetCode Hard 37. Sudoku Solver
// https://leetcode.com/problems/sudoku-solver/
// 22.02.10

class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        
        func check(row: Int, col: Int, val: Character) -> Bool {
            for i in 0..<9 {
                guard board[i][col] != val else { return false }
                guard board[row][i] != val else { return false }
                guard board[(row/3)*3+(i/3)][(col/3)*3+(i%3)] != val else { return false }
            }
            return true
        }
        
        func DFS() -> Bool {
            for i in 0..<9 {
                for j in 0..<9 {
                    guard board[i][j] == "." else { continue }
            
                    for char in "123456789" {
                        if check(row: i, col: j, val: char) {
                            board[i][j] = char
                            if DFS() {
                                return true
                            }
                            board[i][j] = "."
                        }
                    }
                    return false
                }
            }
            return true
        }
        
        DFS()
    }
    
}

