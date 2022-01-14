// 프로그래머스 이분탐색 > 입국심사
// https://programmers.co.kr/learn/courses/30/lessons/43238
// 22.01.12

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var result: Int64 = 0
    
    var left: Int64 = 1
    var right: Int64 = Int64(times.min()!) * Int64(n)
    
    while left <= right {
        let mid: Int64 = (left + right) / Int64(2)
        var people: Int64 = 0
        
        for time in times {
            let time = Int64(time)
            people += (mid / time)
            
            if people >= n {
                break
            }
        }
        
        if people >= n {
            result = mid
            right = mid - 1
        } else if people < n {
            left = mid + 1
        }
    }
    
    return result
}

