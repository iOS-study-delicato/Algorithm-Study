# Baekjoon

## [DFS와 BFS](https://www.acmicpc.net/problem/1260)

* 분류: 그래프 이론, 그래프 탐색, 너비 우선 탐색, 깊이 우선 탐색
* 풀이 언어: Swift
* 문제 요약: 그래프를 DFS로 탐색한 결과와 BFS로 탐색한 결과를 출력

### 코드

```swift
let nmv = readLine()!.split(separator: " ").map { Int(String($0))! }

var graph = [[Int]](repeating: [Int](), count: nmv[0] + 1)
for _ in 0..<nmv[1] {
    let road = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[road.first!].append(road.last!)
    graph[road.last!].append(road.first!)
}

for i in 1...nmv[0] {
    graph[i].sort()
}

var visited = [Bool](repeating: false, count: nmv[0] + 1)
func dfs(_ node: Int) -> [Int] {
    var result = [node]
    visited[node] = true
    for i in graph[node] {
        if !visited[i] {
            result += dfs(i)
        }
    }
    return result
}

func bfs(_ node: Int) -> [Int] {
    var result = [Int]()
    var indx = 0
    var queue = [node]
    visited[node] = true
    while indx < queue.count {
        let num = queue[indx]
        result.append(num)
        for i in graph[num] {
            if !visited[i] {
                queue.append(i)
                visited[i] = true
            }
        }
        indx += 1
    }
    return result
}

print(dfs(nmv[2]).map { String($0) }.joined(separator: " "))
visited = [Bool](repeating: false, count: nmv[0] + 1)
print(bfs(nmv[2]).map { String($0) }.joined(separator: " "))
```

* 메모리: 62504 KB
* 시간: 24 ms

### 회고

* 간선 정보를 처리하는 것이 어려웠던 문제. 검색을 통해 2차원 배열로 해결할 수 있음을 배웠다.
* 꽤 많이 DFS, BFS 문제를 풀어보았다고 생각했는데 아직도 헷갈리는 점이 많다. 계속 정진하자!