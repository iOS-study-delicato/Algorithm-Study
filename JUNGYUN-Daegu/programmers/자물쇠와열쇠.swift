
// Programmars 2020 KAKAO BLIND RECRUITMENT 자물쇠와 열쇠
// https://programmers.co.kr/learn/courses/30/lessons/60059
// 21.10.01

import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    
    func rotateKey(with key: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        
        for column in 0..<key.count {
            var newRow = [Int]()
            for row in 0..<key.count {
                newRow.append(key[row][column])
            }
            result.append(newRow.reversed())
        }
        
        return result
    }
    
    // make vector
    let boardSize = ((key.count - 1) * 2) + lock.count
    var board: [[Int]] = Array(repeating: Array(repeating: 0, count: boardSize), count: boardSize)
    
    // allocate lock in the middle of the board
    for row in 0..<lock.count {
        for column in 0..<lock.count {
            board[key.count - 1 + row][key.count - 1 + column] = lock[row][column]
        }
    }
    
    func insertKey(x: Int, y: Int, key: [[Int]]) -> Bool {
        for i in x..<x + key.count {
            for j in y..<y + key.count {
                board[i][j] += key[i - x][j - y]
            }
        }
        
        for i in key.count - 1...boardSize - key.count {
            for j in key.count - 1...boardSize - key.count {
                if board[i][j] == 1 {
                    continue
                } else {
                    // undo board
                    for a in x..<x + key.count {
                        for b in y..<y + key.count {
                            board[a][b] -= key[a - x][b - y]
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
    
    var result = false
    var myKey = key
    
    for _ in 1...4 {
        
        for i in 0...boardSize - key.count {
            for j in 0...boardSize - key.count {
                if insertKey(x: j, y: i, key: myKey) {
                    result = true
                    return result
                }
            }
        }
        
        myKey = rotateKey(with: myKey)
    }
    
    return result
}
