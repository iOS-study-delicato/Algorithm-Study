// BOJ 2293 동전 1
// https://www.acmicpc.net/problem/2293
// 22.02.06
import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }

let coinCount = NK[0]
var target = NK[1]

var coins: [Int] = []

for _ in 0..<coinCount {
    let coin = Int(readLine()!)!
    coins.append(coin)
}

var dp = Array(repeating: 0, count: target + 1)
dp[0] = 1

for coin in coins {
    for i in 1...target {
        guard i >= coin else { continue }
        dp[i] = dp[i] + dp[i - coin]
        if dp[i] >= Int(pow(2.0, 31.0)) { dp[i] = 0 }
    }
}

print(dp[target])

