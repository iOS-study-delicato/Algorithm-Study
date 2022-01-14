// BOJ 11404 플로이드
// https://www.acmicpc.net/problem/11404
// 22.01.14

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = Array(repeating: Array(repeating: Int.max, count: n + 1), count: n + 1)

for _ in 0..<m {
    let busInfo = readLine()!.split(separator: " ").map { Int($0)! }
    let start = busInfo[0]
    let dest = busInfo[1]
    let cost = busInfo[2]
    
    graph[start][dest] = graph[start][dest] <= cost ? graph[start][dest] : cost
}

for k in 1...n {
    for from in 1...n {
        for to in 1...n {
            if from == to { continue }
            if graph[from][k] == Int.max || graph[k][to] == Int.max { continue }
                graph[from][to] = min(graph[from][to], graph[from][k] + graph[k][to])
        }
    }
}



for i in 1...n {
    for j in 1...n {
        print(graph[i][j] == Int.max ? 0 : graph[i][j])
    }
}
