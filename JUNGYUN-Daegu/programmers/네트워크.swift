
// 프로그래머스 깊이/너비 우선 탐색 DFS/BFS > 네트워크
// https://programmers.co.kr/learn/courses/30/lessons/43162
// 22.01.09


import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    
    var visited = Array(repeating: false, count: n)
    var adjacentList: [Int: [Int]] = [:]
    
    
    for (i, computer) in computers.enumerated() {
        for j in 0..<n {
            if i == j {
                continue
            } else if computer[j] == 1 {
                if adjacentList[i] == nil {
                    adjacentList[i] = [j]
                } else {
                    adjacentList[i]!.append(j)
                }
            }
        }
    }
    
    
    var result: Int = 0
    
    
    func BFS(with computerNumber: Int) {
        var q: [Int] = []
        q.append(computerNumber)
        visited[computerNumber] = true
        
        while !q.isEmpty {
            let next = q.removeFirst()
            
            if let connected = adjacentList[next] {
                for computer in connected {
                    if visited[computer] == false {
                        visited[computer] = true
                        q.append(computer)
                    }
                }
            }
            
        }
        result += 1
    }
    
    
    for k in 0..<n {
        guard visited[k] == false else { continue }
        
        if adjacentList[k] != nil {
            BFS(with: k)
        } else {
            result += 1
        }
    }
    
    
    return result
}
