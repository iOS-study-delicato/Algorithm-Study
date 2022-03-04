// BOJ 2447 별 찍기 - 10
// https://www.acmicpc.net/problem/2447
// 22.02.26

let N = Int(readLine()!)!

var board = Array(repeating: Array(repeating: " ", count: N), count: N)

func putStars(x: Int, y: Int, size: Int) {
    if size > 3 {
        let nextSize = size / 3
        
        for i in 0..<3 {
            for j in 0..<3 {
                if i == 1 && j == 1 { continue }
                putStars(x: x + (j * nextSize), y: y + (i * nextSize), size: nextSize)
            }
        }
        
    } else {
        for i in y..<y+3 {
            for j in x..<x+3 {
                if i - y == 1 && j - x == 1 { continue }
                board[i][j] = "*"
            }
        }
    }
}

putStars(x: 0, y: 0, size: N)

for row in board {
    print(row.joined())
}

