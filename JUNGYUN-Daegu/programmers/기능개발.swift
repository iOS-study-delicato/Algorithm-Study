// 프로그래머스 기능개발
// https://programmers.co.kr/learn/courses/30/lessons/42586
// 22.02.17

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result: [Int] = []
    var daysPassed = 1
    var taskFinished = 0
    var index = 0
    
    while index < progresses.count {
        if progresses[index] + (daysPassed * speeds[index]) >= 100 {
            taskFinished += 1
            index += 1
        } else {
            if taskFinished != 0 {
                result.append(taskFinished)
            }
            taskFinished = 0
            daysPassed += 1
        }
    }
    
    result.append(taskFinished)
    
    return result
}

