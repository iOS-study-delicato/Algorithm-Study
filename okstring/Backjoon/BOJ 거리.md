### BOJ 거리



중복되는 검사가 계속돼서 효율이 좋지 않았다.

```swift
let N = Int(readLine()!)! - 1
let street = Array(readLine()!).map({ String($0) })
let boj = ["B": "O", "O": "J", "J": "B"]

var result = Int.max
var memo = Array(repeating: Int.max, count: street.count)

func d(idx: Int, c: Int) {
    if idx == N {
        result = min(result, c)
    } else if idx >= street.count {
        return
    }
    
    let n = boj[street[idx]]!
    
    for i in idx+1..<street.count {
        if street[i] == n && memo[i] > c + ((i-idx)*(i-idx)) {
            memo[i] = c + ((i-idx)*(i-idx))
            d(idx: i, c: c + ((i-idx)*(i-idx)))
        }
    }
}
d(idx: 0, c: 0)
print(result == Int.max ? -1 : result)
```







### 올바른 풀이

https://www.acmicpc.net/source/26432055

```swift
let N = Int(readLine()!)!

let path = readLine()!.map{String($0)}

var dp = Array(repeating:Int.max,count:N)
dp[0] = 0
for i in 0..<N {
    if i != 0 && dp[i] == Int.max { continue }
    var next = ""
    if path[i] == "B" {
        next = "O"
    }else if path[i] == "O" {
        next = "J"
    }else {
        next = "B"
    }
    
    for j in i+1..<N {
        if path[j] == next {
            dp[j] = min(dp[j], (j-i)*(j-i)+dp[i])
        }
    }
}

print(dp[N-1] == Int.max ? -1 : dp[N-1])
```

