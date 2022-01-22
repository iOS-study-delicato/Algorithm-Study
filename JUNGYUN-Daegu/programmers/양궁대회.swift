// 프로그래머스 > 2022 KAKAO BLIND RECRUITMENT > 양궁대회
// https://programmers.co.kr/learn/courses/30/lessons/92342
// 22.01.22

import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    
    
    var result: [Int] = []
    var currentDifference: Int = 0
    
    
    func takable(at i: Int, arrowsLeft: Int) -> Bool {
        return arrowsLeft > info[i] ? true : false
    }
    
    
    func getDiff(ryanInfo: [Int]) -> Int {
        var ryan: Int = 0
        var appeach: Int = 0
        
        for i in 0..<info.count {
            if info[i] == 0 && ryanInfo[i] == 0 {
                continue
            } else if info[i] >= ryanInfo[i] {
                appeach += (10 - i)
            } else {
                ryan += (10 - i)
            }
        }
        
        return ryan - appeach
    }
    
    
    
    func priorityCheck(currentResult: [Int], isPriorTo newInfo: [Int]) -> Bool {
        var result: Bool = false
        
        for i in stride(from: currentResult.count - 1, through: 0, by: -1) {
            if currentResult[i] == newInfo[i] {
                continue
            } else if currentResult[i] > newInfo[i] {
                result = true
                break
            } else {
                result = false
                break
            }
        }
        
        return result
    }
    
    
    
    func DFS(idx: Int, arrowsLeft: Int, ryanInfo: [Int]) {
        
        if idx == info.count - 1 || arrowsLeft == 0 {
            var newInfo = ryanInfo
            newInfo[idx] = arrowsLeft
            let scoreDifference = getDiff(ryanInfo: newInfo)
            
            if  scoreDifference > currentDifference {
                result = newInfo
                currentDifference = scoreDifference
                
            } else if scoreDifference == currentDifference {
                
                if priorityCheck(currentResult: result, isPriorTo: newInfo) {
                    return
                } else {
                    result = newInfo
                }
                
            }
            
            return
        }
        
        // 점수를 가지고 진행
        if takable(at: idx, arrowsLeft: arrowsLeft) {
            var newInfo = ryanInfo
            newInfo[idx] = info[idx] + 1
            
            DFS(idx: idx + 1, arrowsLeft: arrowsLeft - (info[idx] + 1), ryanInfo: newInfo)
        }
        
        // 점수를 가지지 않고 진행
        DFS(idx: idx + 1, arrowsLeft: arrowsLeft, ryanInfo: ryanInfo)
    }
    
    
    DFS(idx: 0, arrowsLeft: n, ryanInfo: Array(repeating: 0, count: info.count))
    
    
    if currentDifference <= 0 {
        return [-1]
    } else {
        return result
    }
    
}
