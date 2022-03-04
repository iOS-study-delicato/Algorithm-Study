// Leetcode > 48. Rotate Image
// https://leetcode.com/problems/rotate-image/
// 22.03.03

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        for i in 0..<matrix.count {
            for j in i+1..<matrix[0].count {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
            matrix[i] = matrix[i].reversed()
        }
    }
}
