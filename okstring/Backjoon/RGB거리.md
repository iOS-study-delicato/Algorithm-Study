## RGB거리



각 비용의 최소값을 가지고 그리디 알고리즘이 가능할까 시도해봤지만 실패





https://woongsios.tistory.com/227

```swift
let N = Int(readLine()!)!

var houses = [[Int]]()

for _ in 0..<N {
    let rgb = readLine()!.split(separator: " ").map({ Int(String($0))! })
    houses.append(rgb)
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N)

dp[0][0] = houses[0][0]
dp[0][1] = houses[0][1]
dp[0][2] = houses[0][2]

for idx in 1..<N {
    for color in 0..<3 {
        let other1 = (color+1) % 3
        let other2 = (color+2) % 3
        dp[idx][color] = min(dp[idx-1][other1] + houses[idx][color], dp[idx-1][other2] + houses[idx][color])
    }
}

print(min(dp[N-1][0], dp[N-1][1], dp[N-1][2]))
```

