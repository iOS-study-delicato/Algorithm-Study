# Baekjoon

## [괄호](https://www.acmicpc.net/problem/9012)

* 분류: 자료 구조, 문자열, 스택
* 풀이 언어: Swift
* 문제 요약: 주어진 괄호 문자열이 VPS(올바른 괄호 문자열)인지 아닌지 판단하기

### 코드

```swift
let n = Int(readLine()!)!

for _ in 0..<n {
    let tc = readLine()!.map { String($0)}
    print(isVPS(tc) ? "YES" : "NO")
}

func isVPS(_ ps: [String]) -> Bool {
    var sum = 0
    for i in ps {
        sum += (i == "(") ? 1 : -1
        if sum < 0 {
            return false
        }
    }
    return sum == 0
}
```

* 메모리: 62228 KB
* 시간: 8 ms

### 회고

* 괄호 문제는 예전에도 여러번 풀어봤는데 이번 기회에 제대로 정리!