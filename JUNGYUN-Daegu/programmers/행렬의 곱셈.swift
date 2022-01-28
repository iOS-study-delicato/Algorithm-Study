// 프로그래머스 > 행렬의 곱셈
// https://programmers.co.kr/learn/courses/30/lessons/12949
// 22.01.23

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    var result = [[Int]]()
    
    for i in 0..<arr1.count {
        var tempResult: [Int] = []
        
        for k in 0..<arr2[0].count {
            var tempResult2: Int = 0
            
            for j in 0..<arr1[0].count {
                tempResult2 += arr1[i][j] * arr2[j][k]
            }
            
            tempResult.append(tempResult2)
        }
        
        result.append(tempResult)
    }
    
    return result
}

