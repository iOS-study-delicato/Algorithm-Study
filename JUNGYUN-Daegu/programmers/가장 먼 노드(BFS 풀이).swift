// 프로그래머스 그래프 > 가장 먼 노드
// https://programmers.co.kr/learn/courses/30/lessons/49189
// 22.01.04

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var result: Int = 0
    var farrestDistance: Int = 0
    
    var visited = Array(repeating: false, count: n + 1)
    
    var list: [Int: [Int]] = [:]
    
    //draw adjacent list
    for route in edge {
        let start = route.first!
        let dest = route.last!
        
        if list[start] != nil {
            list[start]!.append(dest)
        } else {
            list[start] = [dest]
        }
        
        if list[dest] != nil {
            list[dest]!.append(start)
        } else {
            list[dest] = [start]
        }
    }
    
    //distance: Int, node: Int
    var q: [(Int, Int)] = []
    q.append((0, 1))
    
    visited[1] = true
    
    //BFS
    while !q.isEmpty {
        
        let next = q.removeFirst()
        let distance = next.0
        let node = next.1
        
        func isFinalNode() -> Bool {
            for i in list[node]! {
                if visited[i] == false {
                    return false
                }
            }
            return true
        }
        
        if isFinalNode() {
            if farrestDistance < distance {
                farrestDistance = distance
                result = 1
            } else if farrestDistance == distance {
                result += 1
            }
        } else {
            for nextNode in list[node]! {
                if visited[nextNode] == false {
                    q.append((distance + 1, nextNode))
                    visited[nextNode] = true
                }
            }
        }
    }
    
    return result
}

print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]))

