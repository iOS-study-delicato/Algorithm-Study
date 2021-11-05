# Baekjoon

## [수 정렬하기 2](https://www.acmicpc.net/problem/2751)

* 분류: 정렬
* 풀이 언어: Swift
* 문제 요약: 주어진 N개의 수를 오름차순으로 정렬

### 코드

```swift
var array = [Int]()
for _ in 0..<Int(readLine()!)! {
    array.append(Int(readLine()!)!)
}

array = array.sorted()

var result = ""
for i in array {
    result += "\(i)\n"
}

print(result)
```

* 메모리: 90540 KB
* 시간: 768 ms

### 회고

* Swift의 `sort()` 혹은 `sorted()` 함수를 사용하면 쉽게 풀 수 있는 문제였다. 두 함수를 이용해 여러 조합으로 풀이를 제출해보았는데 위 버전이 메모리나 시간 면에서 가장 효율이 좋았다.
* 문제에 주어지는 수는 중복되지 않는다는 설명이 있어 `Array` 대신 `Set`을 이용해서도 풀어보았다. 백준 기준 메모리는 107184 KB, 시간은 996 ms로 `Array`로 푸는 것에 비해 어느 면에서도 이득이 없었다.