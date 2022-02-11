// Programmers N으로 표현
// https://programmers.co.kr/learn/courses/30/lessons/42895
// 22.02.11

import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    if N == number {
        return 1
    }
    
    let usageCount = 8
    var result = -1
    var sets: [Set<Int>] = Array(repeating: Set<Int>(), count: usageCount)
    
    // 각 set마다 기본 수 "N" * i 수 초기화
    for i in 0..<usageCount {
        var simplyRepeated = 0
        
        for _ in 0...i {
            simplyRepeated = (simplyRepeated * 10) + N
        }
        
        sets[i].insert(simplyRepeated)
    }
    
    for i in 0..<usageCount {
        for j in 0..<i {
            for element1 in sets[j] {
                for element2 in sets[i-j-1] {
                    sets[i].insert(element1 + element2)
                    sets[i].insert(element1 - element2)
                    sets[i].insert(element1 * element2)
                    if element2 != 0 {
                        sets[i].insert(element1 / element2)
                    }
                }
            }
        }
        
        if sets[i].contains(number) {
            result = i + 1
            break
        }
    }
    
    return result
}

