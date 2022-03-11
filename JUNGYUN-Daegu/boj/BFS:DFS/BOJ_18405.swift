// BOJ 18405 경쟁적 전염
// https://www.acmicpc.net/problem/18405
// 22.03.11

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let n = NK.first!
let k = NK.last!

var board: [[Int]] = [Array(repeating: 0, count: n + 1)]
var s: Int = 0
var x: Int = 0
var y: Int = 0


for i in 0...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    if i == n {
        s = input[0]
        x = input[1]
        y = input[2]
    } else {
        var row = [0]
        row.append(contentsOf: input)
        board.append(row)
    }
}

func BFS() {
    let moves = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    var currentTime = 0
    var q: [(row: Int, column: Int, virus: Int)] = []
    
    for i in 1..<board.count {
        for j in 1..<board[1].count {
            if board[i][j] != 0 {
                q.append((row: i, column: j, virus: board[i][j]))
            }
        }
    }
    
    while currentTime < s {
        var nextQ: [(row: Int, column: Int, virus: Int)] = []
        
        q = q.sorted(by: { lhs, rhs in
            lhs.virus > rhs.virus
        })
        
        while !q.isEmpty {
            let now = q.popLast()!
            
            for move in moves {
                if now.row + move.0 > 0 &&
                    now.column + move.1 > 0 &&
                    now.row + move.0 <= n &&
                    now.column + move.1 <= n &&
                    board[now.row + move.0][now.column + move.1] == 0 {
                    
                    board[now.row + move.0][now.column + move.1] = now.virus
                    nextQ.append((row: now.row + move.0, column: now.column + move.1, virus: now.virus))
                    
                }
            }
        }
        
        q = nextQ
        currentTime += 1
    }
}

BFS()

print(board[x][y])
