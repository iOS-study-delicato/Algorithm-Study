// 프로그래머스 > 2022 KAKAO BLIND RECRUITMENT > 파괴되지 않은 건물
// https://programmers.co.kr/learn/courses/30/lessons/92344
// 22.02.18

import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    // make 1 unit bigger so to make the logic simple
    var sumBoard = Array(repeating: Array(repeating: 0, count: board[0].count + 1), count: board.count + 1)
    
    for skill in skill {
        let type = skill[0]
        let r1 = skill[1]
        let c1 = skill[2]
        let r2 = skill[3]
        let c2 = skill[4]
        var degree = skill[5]
        degree = type == 1 ? degree * -1 : degree
        
        sumBoard[r1][c1] += degree
        sumBoard[r2 + 1][c2 + 1] += degree
        sumBoard[r2 + 1][c1] -= degree
        sumBoard[r1][c2 + 1] -= degree
    }

    // cumulative sum top down
    for row in 1..<sumBoard.count {
        for col in 0..<sumBoard[0].count {
            sumBoard[row][col] = sumBoard[row][col] + sumBoard[row - 1][col]
        }
    }
    
    // cumulative sum left right
    for col in 1..<sumBoard[0].count {
        for row in 0..<sumBoard.count {
            sumBoard[row][col] = sumBoard[row][col] + sumBoard[row][col - 1]
        }
    }
    
    var result: Int = 0
    
    for row in 0..<board.count {
        for col in 0..<board[0].count {
            if board[row][col] + sumBoard[row][col] > 0 {
                result += 1
            }
        }
    }
    
    return result
}

