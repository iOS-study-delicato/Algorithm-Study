# Baekjoon

## [추론](https://www.acmicpc.net/problem/1731)

* 분류: 수학
* 풀이 언어: Swift
* 문제 요약: 주어진 수열이 등차수열인지, 등비수열인지 결정하고 수열의 다음 원소를 출력

### 코드

##### 수식 이용 풀이

```swift
let n = Double(readLine()!)!
var array = [Double](repeating: 0, count: 3)

for i in 0..<3 {
    array[i] = Double(readLine()!)!
}

let p: Double = array.first!
var q: Double = 0
var result: Int = 0

if array[1] - p == array[2] - array[1] {
    q = array[1] - p
    result = Int(p + q * n)
}
if array[1] / p == array[2] / array[1] {
    q = array[1] / p
    result = Int(p * (0..<Int(n)).reduce(1) { result, _ in result * q })
}
print(result)
```

* 메모리: 62224 KB
* 시간: 8 ms

##### 배열 이용 풀이

```swift
let n = Int(readLine()!)!
var array = [Double](repeating: 0, count: n)

for i in 0..<n {
    array[i] = Double(readLine()!)!
}

let p: Double = array.first!
var q: Double = 0
var result: Int = 0

if array[1] - p == array[2] - array[1] {
    q = array[1] - p
    result = Int(array[n - 1] + q)
}
if array[1] / p == array[2] / array[1] {
    q = array[1] / p
    result = Int(array[n - 1] * q)
}
print(result)
```

* 메모리: 62228 KB
* 시간: 8 ms

### 회고

* 브론즈인만큼 그리 어려운 문제는 아니나... 등비가 정수가 아닌 수가 될 수 있다는 것을 간과하면 풀 수 없었던 문제😭