// 프로그래머스 그래프 > 순위
// https://programmers.co.kr/learn/courses/30/lessons/49191
// 22.01.18


import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    
    // graph는 전적의 여부, 이 후에 모든 사람에 대해 갱신하므로 만약 빠진 전적이 없으면 false로 남게된다.
    var graph = Array(repeating: Array(repeating: false, count: n + 1), count: n + 1)
    
    for result in results {
        let winner = result.first!
        let loser = result.last!
        
        graph[winner][loser] = true
    }
    
     for k in 1..<n + 1 {
        for i in 1..<n + 1 {
            for j in 1..<n + 1 {
                
                if graph[i][k] == true && graph[k][j] == true {
                    graph[i][j] = true
                }
                
            }
        }
    }
    
    var result: Int = 0
    
    for a in 1..<n+1 {
        var count: Int = 0
        
        for b in 1..<n+1 {
            if graph[a][b] == true || graph[b][a] == true {
                count += 1
            }
        }
        
        if count == n - 1 {
            result += 1
        }
    }
    
    return result
}

