# Baekjoon

## [회의실 배정](https://www.acmicpc.net/problem/1931)

* 분류: 그리디 알고리즘, 정렬
* 풀이 언어: Swift
* 문제 요약: N개의 회의의 시작과 끝 시간이 주어질 때, 겹치지 않게 열 수 있는 회의의 최대 개수를 출력

### 코드

```swift
let n = Int(readLine()!)!
var meetings = [(start: Int, end: Int)](repeating: (0, 0), count: n)
var result = 0

for i in 0..<n {
    let t = readLine()!.split(separator: " ").map { Int(String( $0))! }
    meetings[i] = (t.first!, t.last!)
}

meetings.sort {
    return $0.end == $1.end ? $0.start < $1.start : $0.end < $1.end
}

var nextStart = 0
for i in meetings {
    if i.start >= nextStart {
        nextStart = i.end
        result += 1
    }
}

print(result)
```

* 메모리: 64584 KB
* 시간: 164 ms

### 회고

* 회의가 끝나는 시간을 기준으로 정렬을 하면 되겠다는 것까지는 캐치했지만 자꾸 정답이 나오지 않았다🤧
* 백준 질문 게시판을 통해 반례를 찾을 수 있었다!
  * 주어진 회의 정보가 (1, 3), (8, 8), (4, 8)이라면 답은 3이다. 회의가 끝나는 것과 동시에 다음 회의가 시작될 수 있으니 (1, 3), (4, 8), (8, 8)순으로 회의가 열릴 수 있기 때문이다. 즉 회의가 끝나는 시간이 같다면 회의 시작 시간을 기준으로도 정렬을 해주어야 하는 것이다.