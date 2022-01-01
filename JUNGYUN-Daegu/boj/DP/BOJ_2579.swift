// BOJ 2579 계단 오르기
// https://www.acmicpc.net/problem/2579
// 21.12.31

let cnt = Int(readLine()!)!

var score = Array(repeating: 0, count: cnt + 1)

for i in 1...cnt {
    let input = Int(readLine()!)!
    
    score[i] = input
}

var dp = Array(repeating: 0, count: cnt + 1)

for i in 1...cnt {
    guard i >= 3 else {
        dp[i] = score[i] + score[i - 1]
        continue
    }
    
    dp[i] = max(dp[i - 2] + score[i], dp[i - 3] + score[i] + score[i - 1])
}

print(dp[cnt])

