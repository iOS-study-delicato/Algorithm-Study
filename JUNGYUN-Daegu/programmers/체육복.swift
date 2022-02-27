// Programmers > 탐욕법(Greedy) > 체육복
// https://programmers.co.kr/learn/courses/30/lessons/42862#
// 22.02.27

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var lost = Set(lost)
    var reserve = Set(reserve)
    
    for i in 1...n {
        if lost.contains(i) {
            if reserve.contains(i) {
                lost.remove(i)
                reserve.remove(i)
                continue
            }
            
            if i > 0 && reserve.contains(i - 1) {
                guard !lost.contains(i - 1) else { continue }
                lost.remove(i)
                reserve.remove(i - 1)
                continue
            }
            
            if i < n && reserve.contains(i + 1) {
                guard !lost.contains(i + 1) else { continue }
                lost.remove(i)
                reserve.remove(i + 1)
                continue
            }
        }
    }

    return n - lost.count
}

