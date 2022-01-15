// 프로그래머스 정렬 > K번째 수
// https://programmers.co.kr/learn/courses/30/lessons/42748
// 22.01.15


import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    func getSortedArray(start: Int, end: Int) -> [Int] {
        var slicedArray: [Int] = []
        
        for i in start...end {
            slicedArray.append(array[i - 1])
        }
        
        return slicedArray.sorted()
    }
    
    var result: [Int] = []
    
    for command in commands {
        let i = command[0]
        let j = command[1]
        let k = command[2]
        
        result.append(getSortedArray(start: i, end: j)[k - 1])
    }
    
    return result
}
