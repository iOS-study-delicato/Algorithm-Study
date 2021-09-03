# Baekjoon

## [음식물 피하기](https://www.acmicpc.net/problem/1743)

* 분류: 그래프 이론, 그래프 탐색, 너비 우선 탐색, 깊이 우선 탐색
* 풀이 언어: Swift
* 문제 요약: 통로와 음식물 쓰레기에 대한 정보가 주어질 때 음식물 쓰레기 중 가장 큰 음식물의 크기 구하기

### 코드

```swift
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var grid = [[Bool]](repeating: [Bool](repeating: false, count: input[1]), count: input[0])
var result = 0
var count = 0

for _ in 0..<input[2] {
    let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
    grid[rc.first! - 1][rc.last! - 1] = true
}

for i in 0..<input[0] {
    for j in 0..<input[1] {
        if grid[i][j] {
            count = 1
            findAdjacentTrash(i, j)
            result = (result > count) ? result : count
        } else {
            continue
        }
    }
}

print(result)

func findAdjacentTrash(_ row: Int, _ column: Int) {
    grid[row][column] = false
    let direction = [(0, -1), (-1, 0), (0, 1), (1, 0)]
    for d in direction {
        let r = row + d.0
        let c = column + d.1
        if r < 0 || r >= input[0] || c < 0 || c >= input[1] {
            continue
        }
        if grid[r][c] {
            count += 1
            findAdjacentTrash(r, c)
        }
    }
}
```

* 메모리: 62420 KB
* 시간: 12 ms
