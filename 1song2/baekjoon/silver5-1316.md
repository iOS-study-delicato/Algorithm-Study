# Baekjoon

## [그룹 단어 체커](https://www.acmicpc.net/problem/1316)

* 분류: 구현, 문자열
* 풀이 언어: Swift
* 문제 요약: 그룹 단어(단어 내 각 문자가 연속해서 나타나는 단어)의 개수 출력

### 코드

```swift
let n = Int(readLine()!)!
var result = 0

for _ in 0..<n {
    var checker = [Character]()
    let word = readLine()!
    for i in word {
        if !checker.contains(i) {
            checker.append(i)
        } else if checker.last != i {
            checker.removeAll()
            break
        }
    }
    result += (checker.count != 0) ? 1 : 0
}

print(result)
```

* 메모리: 62228 KB
* 시간: 8 ms

### 회고

* 처음엔 복잡하게 생각해서 구현이 어려웠다. 심플하게 반복문을 돌면서 `checker` 배열에 현재 문자가 포함돼있지 않으면 문자를 더해주고, 배열에 포함되어 있으나 마지막 요소와 문자가 다르다면 배열을 비우고 반복문을 종료한다. 배열이 빈 경우는 반복문을 일부러 종료시키는 경우밖에 없으므로 배열의 `count`가 0이 아니면 `result`를 1 올려주면 된다.