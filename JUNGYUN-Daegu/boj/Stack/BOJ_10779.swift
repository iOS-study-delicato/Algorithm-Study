// BOJ 10779 쇠막대기
// https://www.acmicpc.net/problem/10799
// 22.01.21

import Foundation

let input = Array(readLine()!)

var currentBarCount: Int = 0
var result: Int = 0

for (index, value) in input.enumerated() {
    if value == "(" {
        currentBarCount += 1
    } else {
        if input[index - 1] == "(" {
            currentBarCount -= 1
            result += currentBarCount
        } else {
            currentBarCount -= 1
            result += 1
        }
    }
}

print(result)

