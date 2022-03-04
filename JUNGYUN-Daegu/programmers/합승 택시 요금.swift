// Programmers > 2021 KAKAO BLIND RECRUITMENT > 합승 택시 요금
// https://programmers.co.kr/learn/courses/30/lessons/72413?language=swift
// 22.03.04

import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var graph = Array(repeating: Array(repeating: Int.max, count: n + 1), count: n + 1)
    
    for fare in fares {
        graph[fare[0]][fare[1]] = fare[2]
        graph[fare[1]][fare[0]] = fare[2]
    }
    
    for x in 1...n {
        graph[x][x] = 0
    }
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                guard graph[i][k] != Int.max && graph[k][j] != Int.max else { continue }
                
                graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
                graph[j][i] = min(graph[j][i], graph[j][k] + graph[k][i])
            }
        }
    }
    
    var result = Int.max
    
    for stopOver in 1...n {
        guard graph[s][stopOver] != Int.max &&
                graph[stopOver][a] != Int.max &&
                graph[stopOver][b] != Int.max else { continue }
        
        let totalCost = graph[s][stopOver] + graph[stopOver][a] + graph[stopOver][b]
        result = min(result, totalCost)
    }

    return result
}

