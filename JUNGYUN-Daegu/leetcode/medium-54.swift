// LeetCode 54. Spiral Matrix
// https://leetcode.com/problems/spiral-matrix/
// 22.02.13

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var matrix = matrix
        let moves = [(0,1),(1,0),(0,-1),(-1,0)]
        var moveIndex = 0
        var result = [matrix[0][0]]
        matrix[0][0] = Int.max
        var current = (row: 0, column: 0)
        
        let elementCount = matrix.count * matrix[0].count
        
        while result.count < elementCount {
            let next = (row: current.row + moves[moveIndex].0, column: current.column + moves[moveIndex].1)
            
            if next.row >= 0 &&
                next.row < matrix.count &&
                next.column >= 0 &&
                next.column < matrix[0].count &&
                matrix[next.row][next.column] != Int.max {
                
                result.append(matrix[next.row][next.column])
                matrix[next.row][next.column] = Int.max
                current = next
            } else {
                moveIndex = (moveIndex + 1) % 4
            }
        }
        
        return result
    }
}

