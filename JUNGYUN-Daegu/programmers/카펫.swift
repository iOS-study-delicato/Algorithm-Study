
// 프로그래머스 완전탐색 > 카펫
// https://programmers.co.kr/learn/courses/30/lessons/42842
// 22.01.01

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var result: [Int] = []
    
    func makeCarpet(coreRow: Int) -> [Int]? {
        let coreColumn = yellow / coreRow
        let supposedBrownBlockCount = ((coreColumn + 2) * 2) + (coreRow * 2)
        
        guard supposedBrownBlockCount == brown else { return nil }
        
        return [coreColumn + 2, coreRow + 2]
    }
    
    var divisor: Int = 1
    
    while true {
        if yellow % divisor == 0 {
            let coreRow = divisor
            
            if let validCarpet = makeCarpet(coreRow: coreRow) {
                result = validCarpet
                return result
            }
        }
        
        divisor += 1
    }
    
    return result
}

