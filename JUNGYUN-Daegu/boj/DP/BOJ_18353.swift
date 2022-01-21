// BOJ 18353 병사 배치하기
// https://www.acmicpc.net/problem/18353
// 22.01.16

import Foundation

let N = Int(readLine()!)!
var soldiers: [Int] = readLine()!.split(separator: " ").map { Int($0)! }.reversed()

var dp = Array(repeating: 1, count: N)

for i in 1..<N {
    for j in 0..<i {
        if soldiers[j] < soldiers[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(N - dp.max()!)
