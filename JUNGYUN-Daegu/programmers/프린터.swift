
// 프로그래머스 스택/큐 > 프린터
// https://programmers.co.kr/learn/courses/30/lessons/42587
// 22.01.02

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var printedCopy: Int = 0
    var enq: [Int] = []
    var deq: [Int] = priorities.reversed()
    
    func isPrintable(nextDoc: Int) -> Bool {
        
        if deq.contains(where: { $0 > nextDoc }) {
            return false
        } else if enq.contains(where: { $0 > nextDoc }) {
            return false
        } else {
            return true
        }
    }
    
    var desiredLocationInQ: Int = location
    
    while !deq.isEmpty {
        let nextDoc = deq.popLast()!
        
        if desiredLocationInQ == 0 {
            if isPrintable(nextDoc: nextDoc) {
                break
            } else {
                desiredLocationInQ = deq.count + enq.count + 1
                enq.append(nextDoc)
            }
        } else {
            if isPrintable(nextDoc: nextDoc) {
                printedCopy += 1
            } else {
                enq.append(nextDoc)
            }
        }
        
        desiredLocationInQ -= 1
        
        if deq.isEmpty && !enq.isEmpty {
            deq = enq.reversed()
            enq = []
        }
        
    }
    
    return printedCopy + 1
}

