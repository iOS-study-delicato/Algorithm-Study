
// 프로그래머스 완전탐색 > 모의고사
// https://programmers.co.kr/learn/courses/30/lessons/42840
// 22.01.13

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
    func answerOf1(with index: Int) -> Int {
        return (index % 5) + 1
    }
    
    func answerOf2(with index: Int) -> Int {
        if index % 2 == 0 {
            return 2
        } else {
            switch (index % 8) {
                case 5: return 4
                case 7: return 5
                default: return (index % 8)
            }
        }
    }
    
    func answerOf3(with index: Int) -> Int {
        switch index % 10 {
            case 0...1: return 3
            case 2...3: return 1
            case 4...5: return 2
            case 6...7: return 4
            default: return 5
        }
    }
 
    var scoreBoard: [Int] = Array(repeating: 0, count: 3)

    func scoreCheck() {
        for (index, answer) in answers.enumerated() {
            if answer == answerOf1(with: index) { scoreBoard[0] += 1 }
            if answer == answerOf2(with: index) { scoreBoard[1] += 1 }
            if answer == answerOf3(with: index) { scoreBoard[2] += 1 }
        }
    }
    
    scoreCheck()
    
    var result: [Int] = []
    let maxScore = scoreBoard.max()
    
    for supoja in 0..<3 {
        if scoreBoard[supoja] == maxScore {
            result.append(supoja + 1)
        }
    }
    
    return result
}
