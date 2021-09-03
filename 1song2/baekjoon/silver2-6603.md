# Baekjoon

## [로또](https://www.acmicpc.net/problem/6603)

* 분류: 수학, 조합론, 백트래킹, 재귀
* 풀이 언어: Swift
* 문제 요약: 테스트 케이스별로 집합 S에서 6개의 수를 고를 수 있는 모든 방법 구하기
  * 사전 순으로 출력
  * 각 테스트 케이스 사이에는 빈 줄을 하나 출력

### 코드

```swift
while true {
    var input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let k = input.removeFirst()
    if k == 0 {
        break
    }
    solution(m: 6, nums: input)
    print()
}

func solution(m: Int, nums: [Int]) {
    let n = nums.count
    var visit = [Bool](repeating: false, count: n)
    var array = [Int]()

    func dfs(s: Int, depth: Int) {
        if depth == m {
            print(array.map { String($0) }.joined(separator: " "))
            return
        }

        for i in s..<n {
            if visit[i] {
                continue
            }
            visit[i] = true
            array.append(nums[i])
            dfs(s: i, depth: depth + 1)
            array.removeLast()
            visit[i] = false
        }
    }
    dfs(s: 0, depth: 0)
}
```

* 메모리: 62232 KB
* 시간: 12 ms

### 회고

* 이전에 풀었던 [N과 M (2)](https://github.com/1song2/algorithm/blob/main/baekjoon/silver3-15650.md) 문제의 골격을 그대로 가져다 쓰면 되는 문제. 1부터 N까지의 자연수가 아닌 별도의 집합 S에서 수를 골라야 하기 때문에 `nums`라는 `Int` 배열을 매개변수로 넘겨주는 것 외에는 거의 동일하다.
* 암기한 풀이 방식으로 문제가 풀리긴 하지만 아직까지 백트래킹의 원리를 이해 못한 점이 문제... 한문제 한문제 꾸준히 풀어나가면서 이해하려고 노력해봐야겠다.