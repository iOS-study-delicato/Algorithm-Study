
// 프로그래머스 깊이/너비 우선 탐색 > 타겟 넘버
// https://programmers.co.kr/learn/courses/30/lessons/43165
// 21.12.30

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result: Int = 0
    var visited = Array(repeating: false, count: numbers.count)
    
    func combination(k: Int, sum: Int) {
        if k == numbers.count {
            if sum == target {
                result += 1
            }
        } else {
            visited[k] = true
            combination(k: k + 1, sum: sum + numbers[k])
            visited[k] = false
            combination(k: k + 1, sum: sum - numbers[k])
        }
        
    }
    
    combination(k: 0, sum: 0)
    
    return result
}

