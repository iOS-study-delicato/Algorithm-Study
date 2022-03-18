
// BOJ 2252 줄 세우기
// https://www.acmicpc.net/problem/2252
// 22.03.08

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let v = nm[0]
let e = nm[1]

var indegree = Array(repeating: 0, count: v + 1)
var graph = Array(repeating: [Int](), count: v + 1)

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph[input[0]].append(input[1])
    indegree[input[1]] += 1
}

var result: [Int] = []

func topologicalSort() {
    var q = [Int]()
    
    for i in 1...v {
        if indegree[i] == 0 {
            q.append(i)
        }
    }
    
    while !q.isEmpty {
        let now = q.removeFirst()
        result.append(now)
        
        for to in graph[now] {
            indegree[to] -= 1
            
            if indegree[to] == 0 {
                q.append(to)
            }
        }
    }
}

topologicalSort()

for ele in result {
    print(ele)
}
