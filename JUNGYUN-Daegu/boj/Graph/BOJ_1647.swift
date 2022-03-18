
// BOJ 1647 도시 분할 계획
// https://www.acmicpc.net/problem/1647
// 22.03.08

func find(parent: inout [Int], x: Int) -> Int {
    if parent[x] == x {
        return x
    } else {
        return find(parent: &parent, x: parent[x])
    }
}

func union(parent: inout [Int], x: Int, y: Int) {
    let a = find(parent: &parent, x: x)
    let b = find(parent: &parent, x: y)
    
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }
}

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let v = NM[0]
let e = NM[1]

var edges = [(from: Int, to: Int, cost: Int)]()

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    edges.append((from: input[0], to: input[1], cost: input[2]))
}

edges = edges.sorted(by: { lhs, rhs in
    lhs.cost < rhs.cost
})

var parent = Array(repeating: 0, count: v + 1)
var result = 0
var last = 0 // 최소 신장 트리에 포함되는 간선 중 가장 비용이 큰 간선

for i in 1...v {
    parent[i] = i
}

for edge in edges {
    // 사이클이 발생하지 않을 때만 집합에 포함
    if find(parent: &parent, x: edge.from) != find(parent: &parent, x: edge.to) {
        union(parent: &parent, x: edge.from, y: edge.to)
        
        result += edge.cost
        last = edge.cost
    }
}

print(result - last)

