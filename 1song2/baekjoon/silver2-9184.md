# Baekjoon

## [신나는 함수 실행](https://www.acmicpc.net/problem/9184)

* 분류: 다이나믹 프로그래밍, 재귀
* 풀이 언어: Swift
* 문제 요약: 재귀함수 `w(a, b, c)`를 출력

### 코드

```swift
var d = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 21), count: 21), count: 21)
var result = ""

while let input = readLine() {
    if input == "-1 -1 -1" { break }
    let abc = input.split(separator: " ").map { Int(String($0))! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    result += "w(\(a), \(b), \(c)) = \(w(a, b, c))\n"
}

print(result)

func w(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if a <= 0 || b <= 0 || c <= 0 {
        return 1
    } else if a > 20 || b > 20 || c > 20 {
        return w(20, 20, 20)
    } else if d[a][b][c] != -1 {
        return d[a][b][c]
    } else if a < b && b < c {
        d[a][b][c] = w(a, b, c - 1) + w(a, b - 1, c - 1) - w(a, b - 1, c)
        return d[a][b][c]
    } else {
        d[a][b][c] = w(a - 1, b, c) + w(a - 1, b - 1, c) + w(a - 1, b, c - 1) - w(a - 1, b - 1, c - 1)
        return d[a][b][c]
    }
}
```

* 메모리: 62812 KB
* 시간: 36 ms

### 회고

* 아직 DP 넘 어렵...😮‍💨
* 처음에는 `d[a][b][c - 1] == -1 ? w(a, b, c - 1) : d[a][b][c - 1]` 이런 식으로 `d[a][b][c - 1]` 등의 값을 삼항연산자로 판단해주었는데 재귀를 돌면서 `d[a][b][c] != -1`에서 판단이 들어가므로 그럴 필요가 없다는 것을 깨달았다!