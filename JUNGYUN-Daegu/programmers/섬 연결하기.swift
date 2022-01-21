// 프로그래머스 그리디 > 섬 연결하기
// https://programmers.co.kr/learn/courses/30/lessons/42861
// 22.01.19

import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {

    var parent = Array(repeating: 0, count: n)
    let edges = costs.sorted { $0[2] < $1[2] }

    func findParent(of node: Int) -> Int {

        if parent[node] == node {
            return node
        } else {
            parent[node] = findParent(of: parent[node])
            return parent[node]
        }

    }

    func unionParent(a: Int, b: Int) {
        let a = findParent(of: a)
        let b = findParent(of: b)

        if a < b {
            parent[b] = parent[a]
        } else {
            parent[a] = parent[b]
        }
    }

    for i in 0..<n {
        parent[i] = i
    }

    var result: Int = 0

    for edge in edges {
        if findParent(of: edge[0]) != findParent(of: edge[1]) {
            unionParent(a: edge[0], b: edge[1])
            result += edge[2]
        }
    }

    return result
}

