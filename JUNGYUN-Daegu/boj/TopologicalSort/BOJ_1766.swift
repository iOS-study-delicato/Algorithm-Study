// BOJ 1766 문제집
// https://www.acmicpc.net/problem/1766
// 22.03.08

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let v = NM[0]
let e = NM[1]

var graph = Array(repeating: [Int](), count: v + 1)
var indegree = Array(repeating: 0, count: v + 1)

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let from = input[0]
    let to = input[1]
    
    graph[from].append(to)
    indegree[to] += 1
}

var result: [Int] = []

func topologicalSort() {
    // can be improved by priority queue
    var ableToSolve: Set<Int> = []
    
    for i in 1...v {
        if indegree[i] == 0 {
            ableToSolve.insert(i)
        }
    }
    
    while !ableToSolve.isEmpty {
        let now = ableToSolve.min()!
        result.append(now)
        ableToSolve.remove(now)
        
        for to in graph[now] {
            indegree[to] -= 1
            
            if indegree[to] == 0 {
                ableToSolve.insert(to)
            }
        }
    }
}

topologicalSort()

for ele in result {
    print(ele)
}

