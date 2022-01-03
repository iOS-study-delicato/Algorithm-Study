
// 프로그래머스 그래프 > 가장 먼 노드
// https://programmers.co.kr/learn/courses/30/lessons/49189
// 22.01.03
// 시간 초과 풀이!

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {

    var d = Array(repeating: Int.max, count: n + 1)
    d[1] = 0
    
    var graph = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
    
    for route in edge {
        let a = route.first!
        let b = route.last!
        
        // 양 방향
        graph[a][b] = 1
        graph[b][a] = 1
    }

    func dijkstra(startNode: Int) {
        var q = [(idx: Int, cost: Int)]()
        q.append((idx: startNode, cost: d[startNode]))
        
        while !q.isEmpty {
            let node = q.removeFirst()
            let currentNode = node.idx
            let cost = node.cost
            
            for nextNode in 1...n {
                if graph[currentNode][nextNode] != 0 && cost + graph[currentNode][nextNode] < d[nextNode] {
                    d[nextNode] = cost + graph[currentNode][nextNode]
                    q.append((idx: nextNode, cost: d[nextNode]))
                }
            }
        }
    }
    
    dijkstra(startNode: 1)
    
    func mostFarNodeCount() -> Int {
        var count: Int = 0
        var distance: Int = 0
        
        for i in d {
            guard i != Int.max else { continue }
            
            if i > distance {
                distance = i
                count = 1
            } else if i == distance {
                count += 1
            }
        }
        
        return count
    }
    
    return mostFarNodeCount()
}

