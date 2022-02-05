// BOJ 1012 유기농 배추
// https://www.acmicpc.net/problem/1012
// 22.02.05

let T = Int(readLine()!)!
var results: [Int] = []
let moves = [(-1, 0),(1, 0),(0, 1),(0, -1)]

for _ in 0..<T {
    let MNK = readLine()!.split(separator: " ").map { Int($0)! }
    
    let width = MNK[0]
    let height = MNK[1]
    let infoCount = MNK[2]
    
    var graph = Array(repeating: Array(repeating: 0, count: width), count: height)
    
    for _ in 0..<infoCount {
        let info = readLine()!.split(separator: " ").map { Int($0)! }
        let x = info[0]
        let y = info[1]
        
        graph[y][x] = 1
    }
    
    func BFS(row: Int, column: Int) {
        var q = [(row: Int, column: Int)]()
        q.append((row: row, column: column))
        
        while !q.isEmpty {
            let next = q.popLast()!
            graph[next.row][next.column] = 0
            
            for move in moves {
                if next.row + move.0 >= 0 &&
                    next.row + move.0 < height &&
                    next.column + move.1 >= 0 &&
                    next.column + move.1 < width &&
                    graph[next.row + move.0][next.column + move.1] == 1 {
                    
                    q.append((row: next.row + move.0, column: next.column + move.1))
                    
                }
            }
        }
    }
    
    var tempResult = 0
    
    for row in 0..<height {
        for column in 0..<width {
            if graph[row][column] == 1 {
                tempResult += 1
                BFS(row: row, column: column)
            }
        }
    }
    
    results.append(tempResult)
}

for result in results {
    print(result)
}


