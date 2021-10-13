
// Programmars 2019 KAKAO BLIND RECRUITMENT 실패율
// https://programmers.co.kr/learn/courses/30/lessons/42889
// 21.10.15

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var result: [Int] = []
    var tempArray: [(stage: Int, on: Double, passed: Double, failure: Double)] = Array(repeating: (stage: 0, on: 0, passed: 0, failure: 0), count: N + 1)
    
    for i in 0..<tempArray.count {
        tempArray[i].stage = i + 1
    }
    
    for stage in stages {
        tempArray[stage - 1].on += 1
        
        for i in 1...stage {
            guard i != stage else { continue }
            tempArray[i - 1].passed += 1
        }
        
        for i in 1...stage {
            tempArray[i - 1].failure = tempArray[i - 1].on / (tempArray[i - 1].on + tempArray[i - 1].passed)
        }
    }
    
    tempArray.removeLast()
    result = tempArray.sorted { $0.failure > $1.failure }.map { $0.stage }
    
    return result
}
