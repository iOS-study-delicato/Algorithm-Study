// 프로그래머스 그리디 > 무지의 먹방 라이브
// https://programmers.co.kr/learn/courses/30/lessons/42891
// 22.01.20

import Foundation

func solution(_ food_times:[Int], _ k:Int64) -> Int {
    
    if food_times.reduce(0, { $0 + $1 }) <= k {
        return -1
    }
    
    var foodTimes = food_times.enumerated().sorted { $0.element > $1.element }
    var k = Int(k)
    var last:Int = 0
    
    while k - foodTimes.count * (foodTimes.last!.element - last) >= 0 {
            let min = foodTimes.removeLast().element
            k -= (foodTimes.count + 1) * (min - last)
            last = min
    }
    
    let sortedByIndex = foodTimes.sorted { $0.offset < $1.offset }
    
    return sortedByIndex[k % foodTimes.count].offset + 1
}

