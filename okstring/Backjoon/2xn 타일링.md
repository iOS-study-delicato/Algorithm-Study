### 2xn 타일링



```swift
let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1000)

dp[0] = 1
dp[1] = 2

func solution(N: Int) -> Int {
    for i in 2..<N {
        dp[i] = (dp[i-1] + dp[i-2]) % 10007
    }

    return dp[N-1]
}

if N < 3 {
    print(dp[N-1])
} else {
    print(solution(N: N))
}
```

