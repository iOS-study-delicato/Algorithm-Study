# Baekjoon

## [잃어버린 괄호](https://www.acmicpc.net/problem/1541)

* 분류: 수학, 문자열, 그리디 알고리즘, 파싱
* 풀이 언어: Swift
* 문제 요약: 괄호를 적절히 쳐서 만들 수 있는 식의 최소값 출력

### 코드

```swift
var nums = readLine()!
    .split(separator: "-")
    .map { $0.split(separator: "+")
    .map { Int(String($0))! }
    .reduce(0, +)
    }
print(nums[1...].reduce(nums[0], -))
```

* 메모리: 62232 KB
* 시간: 8 ms

### 회고

* '조합을 이용해 풀어야 하나?'하는 생각을 하다 결국 검색을 해보았고 생각보다 간단한 문제라는 것을 알게 되었다.
  * 결과가 최솟값이 되려면 전체에서 최대한 큰 수를 빼줘야 한다. 그러므로 `-`가 나오면 다음 `-`가 나오기 전까지는 계속 수를 더해 마이너스 값을 최대한 크게 만들어줘야 한다.
* 문제의 실마리를 얻은 후에는 고차함수를 이용해 최대한 간결히 푸는 것을 목표로 하였다.