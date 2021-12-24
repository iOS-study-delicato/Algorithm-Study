// BOJ 11049 행렬 곱셈 순서
// https://www.acmicpc.net/problem/11049
// 21.12.24

let N = Int(readLine()!)!

var matrixes: [(r: Int, c: Int)] = []

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap { str in
        return Int(str)
    }
    
    let r = input.first!
    let c = input.last!
    
    matrixes.append((r: r, c: c))
}

var dp = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)

for i in stride(from: N - 1, through: 0, by: -1) {
    for j in (i + 1)..<N {
        dp[i][j] = Int.max
        for k in i...j {
            dp[i][j] = min(dp[i][j], dp[i][k] + dp[k + 1][j] + matrixes[i].r * matrixes[k].c * matrixes[j].c)
        }
    }
}

print(dp[0][N - 1])

