
// 백준 12865 평범한 배낭
// https://www.acmicpc.net/problem/12865
// 21.09.24

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input.first!
let k = input.last!
var weights: [Int] = []
var values: [Int] = []

for _ in 0..<n {
    let itemInput = readLine()!.split(separator: " ").map { Int($0)! }
    let itemWeight = itemInput.first!
    let itemValue = itemInput.last!
    weights.append(itemWeight)
    values.append(itemValue)
}

var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: n)

for i in 0..<n {
    for j in 1...k {
        if i == 0 {
            if j >= weights[i] {
                dp[i][j] = values[i]
            }
        } else {
            if j < weights[i] {
                dp[i][j] = dp[i - 1][j]
            } else {
                dp[i][j] = max(dp[i-1][j], values[i] + dp[i - 1][j - weights[i]])
            }
        }
    }
}

//for i in dp {
//    print(i)
//}

print(dp[n - 1][k])
