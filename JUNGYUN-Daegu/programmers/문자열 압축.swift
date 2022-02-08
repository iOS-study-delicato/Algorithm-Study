// 프로그래머스 > 2020KAKAO BLIND RECRUITMENT > 문자열 압축
// https://programmers.co.kr/learn/courses/30/lessons/60057
// 22.02.08

import Foundation

func solution(_ s:String) -> Int {
    let reversed = s.map { $0 }.reversed()
    var result: Int = Int.max
    
    for unit in 1...s.count {
        var tempReversed = reversed.map {String($0)}
        var count = 0
        var previous = ""
        var tempResult = ""
        
        while tempReversed.count >= unit {
            var sliced = ""
            
            for _ in 0..<unit {
                sliced.append(tempReversed.popLast()!)
            }
            
            if sliced == previous {
                count += 1
            } else {
                if count == 1 {
                    tempResult.append("\(previous)")
                } else if count != 0 {
                    tempResult.append("\(count)\(previous)")
                }
                
                previous = sliced
                count = 1
            }
        }
        
        if count == 1 {
            tempResult.append("\(previous)")
        } else if count != 0 {
            tempResult.append("\(count)\(previous)")
        }
        
        while tempReversed.count != 0 {
            tempResult.append(tempReversed.removeLast())
        }
        
        result = min(result, tempResult.count)
    }
    
    return result
}



