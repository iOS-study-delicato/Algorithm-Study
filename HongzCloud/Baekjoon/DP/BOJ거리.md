# BOJ거리

---

해당 지점까지 걸리는 최소값을 저장하면서 찾았다.

```swift
//DP
let firstInput = Int(readLine()!)!
let street = readLine()!.map{ String($0) }
var answer = Array(repeating: 0, count: street.count)

func check(cur: String, next: String) -> Bool {
    if cur == "B" && next == "O" { return true }
    if cur == "O" && next == "J" { return true }
    if cur == "J" && next == "B" { return true }
    return false
}

for i in 1..<answer.count {
    answer[i] = 10000000
}

for j in 1..<street.count {
    for i in 0..<j {
        if check(cur: street[i], next: street[j]) {
            let k = j-i
            answer[j] = min(answer[j], answer[i] + (k*k))
        }
    }
}

answer[firstInput-1] == 10000000 ? print(-1) : print(answer[firstInput-1])

```

## 깨달은점

- DP의 핵심은 메모이제이션 즉 전의 계산값을 저장해 놓는 것.단 한번만 계산한다

