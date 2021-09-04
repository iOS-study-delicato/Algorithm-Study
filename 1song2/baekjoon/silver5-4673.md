# Baekjoon

## [셀프 넘버](https://www.acmicpc.net/problem/4673)

* 분류: 수학, 구현
* 풀이 언어: Swift
* 문제 요약: 10000 보다 작거나 같은 셀프 넘버(생성자가 없는 숫자)를 출력

### 코드

```swift
let max = 10_000
var array = [Bool](repeating: false, count: max + 1)

for i in 1...max {
    let index = d(i)
    if index <= max {
        array[index] = true
    }
    if !array[i] {
        print(i)
    }
}

func d(_ n: Int) -> Int {
    var newN = n
    var sum = n
    while newN > 0 {
        sum += newN % 10
        newN /= 10
    }
    return sum
}
```

* 메모리: 62224 KB
* 시간: 8 ms

### 회고

* 처음에는 10 이하로는 2씩, 그 이상은 11씩 커지는 규칙에 의해 풀리는 문제인줄 알았다. 그러나 규칙이 꼭 맞아 떨어지지 않아 그 방법은 사용할 수 없었다. 규칙성을 찾는 것도 좋지만 좀더 단순한 접근 방법도 시도해볼 필요가 있다는 걸 잊지 말자!