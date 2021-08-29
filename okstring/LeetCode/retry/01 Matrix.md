# 01 Matrix



### BFS

```swift
class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var result = mat

        func bfs(r: Int, c: Int) -> Int {
          //queue에 담아주고
            var queue = [(r, c)]
            
            while !queue.isEmpty {
                let e = queue.removeFirst()
              //out
                if e.0 < 0 || e.1 < 0 || e.0 >= mat.count || e.1 >= mat[e.0].count {
                    continue
                } else if mat[e.0][e.1] == 0 {
                  //움직인 수의 절대값
                    return abs(r - e.0) + abs(c - e.1)
                }
                queue.append((e.0 + 1, e.1))
                queue.append((e.0 - 1, e.1))
                queue.append((e.0, e.1 + 1))
                queue.append((e.0, e.1 - 1))
            }
          //사실상 의미 없음
            return mat.count * 2
        }

        for r in 0..<mat.count {
            for c in 0..<mat[r].count {
                if mat[r][c] == 1 {
                    result[r][c] = bfs(r: r, c: c)
                }
            }
        }
        return result
    }
}
```



### 오답(Time Limit Exceeded)

```swift
class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        if mat.count == 1 { return [[0]] }
        var result = mat
        
        func dfs(_ r: Int, _ c: Int,_ or: Int,_ oc: Int, _ count: Int) {
            if r < 0 || r >= mat.count || c < 0 || c >= mat[0].count || count > mat.count * 2 {
                return
            } else if mat[r][c] == 0 {
                result[or][oc] = min(result[or][oc], count)
                return
            } else if result[r][c] > 1 {
                result[or][oc] = min(result[or][oc], result[r][c] + count)
            }
            
            dfs(r+1, c, or, oc, count+1)
            dfs(r-1, c, or, oc, count+1)
            dfs(r, c-1, or, oc, count+1)
            dfs(r, c+1, or, oc, count+1)
        }
        
        for r in 0..<mat.count {
            for c in 0..<mat[r].count {
                if mat[r][c] == 1 {
                    result[r][c] = 10000
                    dfs(r, c, r, c, 0)
                }
            }
        }
        return result
    }
}
```





### 다른 풀이

```swift
/*
 처음에는 셀 값이 0이 아닌 경우 Integer.MAX_VALUE(10000)로 설정합니다.
 새로 계산 된 거리 >= 현재 거리인 경우 해당 셀을 다시 탐색 할 필요가 없습니다.
 */
class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var result = mat
        let m = mat.count
        let n = mat[0].count
        
        var queue = [(Int, Int)]()
        for i in 0..<m {
            for j in 0..<n {
                if result[i][j] == 0 {
                    queue.append((i, j))
                } else {
                    result[i][j] = 10000
                }
            }
        }
        
        let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        while !queue.isEmpty {
            let cell = queue.removeFirst()
            for d in dirs {
                let r = cell.0 + d.0
                let c = cell.1 + d.1
                
                if r < 0 || r >= m || c < 0 || c >= n ||
              // +1은 움직였으니, 이동했던 장소가 더 짧은 거리를 알고 있으면 continue
                    result[r][c] <= result[cell.0][cell.1] + 1 {
                    continue
                }
                queue.append((r, c))
                result[r][c] = result[cell.0][cell.1] + 1
            }
        }
        return result
    }
}
```

