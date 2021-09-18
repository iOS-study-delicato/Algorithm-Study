### BOJ 거리

다이나믹 프로그래밍에서는 재귀가 쓰이지 않는다!?

백준 딕셔너리

중복되는 검사가 계속돼서 효율이 좋지 않았다.

### 600ms

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



### 504ms

```swift
let N = Int(readLine()!)! - 1
let street = Array(readLine()!).map({ String($0) })
let boj = ["B": "O", "O": "J", "J": "B"]

var result = Int.max
var memo = Array(repeating: Int.max, count: street.count)

func d(idx: Int, c: Int) {
    if idx == N {
        result = min(result, c)
        return // 리턴 추가
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



#### 백트래킹으로 출력

```
20
BOOOJJJBOOOJJJBOOOJJ
0 0
1 1
4 10
7 19
8 20
11 29
14 38
15 39
18 48
16 42
18 46
17 47
12 36
13 45
9 23
11 27
14 36
15 37
16 40
18 44
17 45
12 32
13 39
10 28
13 37
5 17
6 26
2 4
4 8
7 17
8 18
9 21
11 25
14 34
15 35
16 38
18 42
17 43
12 30
10 26
13 35
5 13
6 20
3 9
6 18
```

#### for문으로 출력

```swift
20
BOOOJJJBOOOJJJBOOOJJ
0 0
1 1
2 4
3 9
4 8
5 13
6 18
7 17
8 18
9 21
10 26
11 25
12 30
13 35
14 34
15 35
16 38
17 43
18 42
19 47
```



올바른 풀이로 풀었을때는 다음 스텝에 대해 한 번만 탐색하며 메모이제이션한 것을 활용하면 되지만

백트래킹으로 풀었을때는 앞단계에서 **불필요한 탐색이 들어가고 그 안에서 for문을 또 돌기 때문에 중복된 탐색이 나오고** 다시 되돌아오기 때문에 비효율적

![img](https://upload.wikimedia.org/wikipedia/commons/2/2c/Depthfirst.png)





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

