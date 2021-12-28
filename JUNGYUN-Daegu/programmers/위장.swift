
// 프로그래머스 해시 > 위장
// https://programmers.co.kr/learn/courses/30/lessons/42578?language=swift
// 21.12.28

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var typeCount: [String:Int] = [:]
    for cloth in clothes {
        if typeCount[cloth.last!] != nil {
            typeCount[cloth.last!]! += 1
        } else {
            typeCount[cloth.last!] = 1
        }

    }
    var count: Int = 1
    
    for (_, value) in typeCount {
        count *= (value + 1)
    }
    return count - 1
}

let sol = solution([["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]])
print(sol)


