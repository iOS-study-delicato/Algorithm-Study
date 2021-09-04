# Baekjoon

## [숨바꼭질](https://www.acmicpc.net/problem/1697)

* 분류: 그래프 이론, 그래프 탐색, 너비 우선 탐색
* 풀이 언어: Swift
* 문제 요약: 1초마다 X-1, X+1, 또는 2*X 위치로 이동할 수 있는 수빈이가 점 K에 있는 동생을 찾는 가장 빠른 시간을 출력

### 코드

```swift
let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let max = Int(1e5) + 1
var queue: [Int] = [nk.first!]
var depth = [Int](repeating: max, count: max)
depth[nk.first!] = 0
var indx = 0

while indx < queue.count {
    let point = queue[indx]
    if point == nk.last! {
        print(depth[point])
        break
    }
    
    if point + 1 < max && depth[point + 1] == max {
        depth[point + 1] = depth[point] + 1
        queue.append(point + 1)
    }
    if 0 <= point - 1 && depth[point - 1] == max {
        depth[point - 1] = depth[point] + 1
        queue.append(point - 1)
    }
    if point * 2 < max && depth[point * 2] == max {
        depth[point * 2] = depth[point] + 1
        queue.append(point * 2)
    }
    indx += 1
}
```

* 메모리: 64584 KB
* 시간: 16 ms

### 회고

* 시간 초과, 런타임 에러 등으로 애를 먹었던 문제 😓

  * 아래 코드처럼 `val`의 범위를 제한하기 이전 배열의 index로 사용하면 런타임 에러가 난다!

    ```swift
    !visit[val] && val <= 100_000 && val >= 0
    ```

* 처음 통과된 제출에선 시간이 420 ms으로 나왔는데 여러번 수정을 통해 16 ms까지 단축할 수 있었다. (더 빠르게 푸신 분들도 있지만 일단 내가 이해할 수 있고 만족하는 코드로는 이게 최선)

  * 처음에는 queue가 빌 때까지 while문을 돌리며 `queue.removeFirst()`로 로직을 처리해주었다. 그러나 index를 이용하면 굳이 O(n)의 `removeFirst()`를 사용하지 않고도 문제 풀이가 가능하다.
  * 시간 효율이 중요한 문제에선 튜플 사용 금지! `queue`와 `depth`를 하나의 튜플로 묶어 제출해보았더니 시간이 972 ms로 치솟았다 🙄