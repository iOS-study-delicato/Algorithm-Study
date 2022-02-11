// BOJ 7569 토마토
// https://www.acmicpc.net/problem/7569
// 22.02.11

let NMH = readLine()!.split(separator: " ").map { Int($0)! }
let width = NMH[0]
let height = NMH[1]
let stack = NMH[2]

var graphs: [[[Int]]] = []

for _ in 0..<stack {
    var graph: [[Int]] = []
    
    for _ in 0..<height {
        graph.append(readLine()!.split(separator: " ").map{ Int($0)! })
    }
    
    graphs.append(graph)
}

var result: Int = 0
let moves = [(1, 0, 0), (-1, 0, 0), (0, 1, 0), (0, -1, 0), (0, 0, 1), (0, 0, -1)]

var q: [(Int, Int, Int)] = []
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: width), count: height), count: stack)

// initial ripe tomato detection
for i in 0..<stack {
    for j in 0..<height {
        for k in 0..<width {
            if graphs[i][j][k] == 1 {
                q.append((i,j,k))
            }
        }
    }
}


func processOneDay() {
    var processed = false
    var tempQ: [(Int,Int,Int)] = []
    
    for _ in 0..<q.count {
        let next = q.removeLast()
        let i = next.0
        let j = next.1
        let k = next.2
        visited[i][j][k] = true
        
        if graphs[i][j][k] == 1 {
            for move in moves {
                if i + move.0 >= 0 && i + move.0 < stack &&
                    j + move.1 >= 0 && j + move.1 < height &&
                    k + move.2 >= 0 && k + move.2 < width &&
                    graphs[i + move.0][j + move.1][k + move.2] == 0 &&
                    !visited[i + move.0][j + move.1][k + move.2] {
                    
                    graphs[i + move.0][j + move.1][k + move.2] = 1
                    tempQ.append((i + move.0,j + move.1,k + move.2))
                    processed = true
                    
                }
            }
        }
    }
            
    if processed {
        result += 1
        q = tempQ
    }

}

while !q.isEmpty {
    processOneDay()
}

outerloop: for graph in graphs {
    for row in graph {
        for tomato in row {
            if tomato == 0 {
                result = -1
                break outerloop
            }
        }
    }
}

print(result)
