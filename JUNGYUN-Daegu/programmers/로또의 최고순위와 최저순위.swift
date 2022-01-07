
// 프로그래머스 로또의 최고 순위와 최저 순위
// https://programmers.co.kr/learn/courses/30/lessons/77484
// 22.01.07

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    
    
    var currentScore: Int = 0
    var hiddenNumCount: Int = 0
    
    
    func cal_result(isOptimistic: Bool) -> Int {
        
        var adjustedScore = currentScore
        
        if isOptimistic {
            adjustedScore += hiddenNumCount
        }
        
        if adjustedScore > 6 {
            adjustedScore = 6
        } else if adjustedScore < 1 {
            adjustedScore = 1
        }
        
        return 7 - adjustedScore
        
    }
    
    
    for lotto in lottos {
        
        if lotto == 0 {
            hiddenNumCount += 1
        } else if win_nums.contains(lotto) {
            currentScore += 1
        }
        
    }
    
    
    return [cal_result(isOptimistic: true), cal_result(isOptimistic: false)]
    
}

