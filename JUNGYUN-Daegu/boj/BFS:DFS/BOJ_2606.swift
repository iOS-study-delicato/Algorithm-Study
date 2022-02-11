// BOJ 2606 바이러스
// https://www.acmicpc.net/problem/2606
// 22.02.09

let nodeCount = Int(readLine()!)!
let edgecount = Int(readLine()!)!

var visited = Array(repeating: false, count: nodeCount + 1)
var adjacentList: [Int: [Int]] = [:]
var result: Int = 0

for _ in 0..<edgecount {
    let connection = readLine()!.split(separator: " ").map { Int($0)! }
    let from = connection[0]
    let to = connection[1]
    
    if adjacentList[from] != nil {
        adjacentList[from]!.append(to)
    } else {
        adjacentList[from] = [to]
    }
    
    if adjacentList[to] != nil {
        adjacentList[to]!.append(from)
    } else {
        adjacentList[to] = [from]
    }
        
}

func DFS(current: Int) {
    if visited[current] == true {
        return
    } else {
        visited[current] = true
        result += 1
        
        guard let connected = adjacentList[current] else { return }
        
        for d in connected {
            DFS(current: d)
        }
    }
}

DFS(current: 1)

// exclude node 1 from result
print(result - 1)

