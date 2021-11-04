// BOJ 2751 수 정렬하기 2
// https://www.acmicpc.net/problem/2751
// 21.11.05

import Foundation

let n = Int(readLine()!)!
var result = [Int]()

for _ in 0..<n {
    let newInput = Int(readLine()!)!
    result.append(newInput)
}

result.sorted().forEach { print($0) }
