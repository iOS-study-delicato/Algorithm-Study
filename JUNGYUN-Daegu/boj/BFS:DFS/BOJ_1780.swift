// BOJ 1780 종이의 개수
// https://www.acmicpc.net/problem/1780
// 22.02.03

let N = Int(readLine()!)!

var graph = [[Int]]()

for _ in 0..<N {
    graph.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func isUsable(row: Int, column: Int, size: Int) -> Bool {
    let pivot = graph[row][column]
    
    for r in row..<row + size {
        for c in column..<column + size {
            if graph[r][c] != pivot {
                return false
            }
        }
    }
    
    return true
}

var dict: [Int: Int] = [-1: 0,
                         0: 0,
                         1: 0]

func DFS(row: Int, column: Int, size: Int) {
    if isUsable(row: row, column: column, size: size) {
        dict[graph[row][column]]! += 1
    } else {
        let dividedSize = size / 3
        
        for i in 0..<9 {
            let newRow = row + ((i / 3) * dividedSize)
            let newColumn = column + ((i % 3) * dividedSize)
            
            DFS(row: newRow, column: newColumn, size: dividedSize)
        }
    }
}

DFS(row: 0, column: 0, size: N)

print(dict[-1]!)
print(dict[0]!)
print(dict[1]!)

