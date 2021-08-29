### Number of lslands

```swift
[
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
```

```swift
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var result = 0
        var map = grid
        
        func dfs(_ r: Int, _ c: Int) {
            if r < 0 || c < 0 || r >= grid.count || c >= grid[0].count || map[r][c] == "0" {
                return
            }
            map[r][c] = "0"
            dfs(r+1, c)
            dfs(r-1, c)
            dfs(r, c+1)
            dfs(r, c-1)
        }
        
        for r in 0..<grid.count {
            for c in 0..<grid[r].count {
                if map[r][c] == "1" {
                    dfs(r, c)
                    result += 1
                }
            }
        }
        return result
    }
}
```





### Stack을 이용한 풀이(DFS)

```swift

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var map = grid
        var count = 0
        
        func dfs(_ r: Int, _ c: Int) {
            var stack = [(r, c)]
            var discovery = [(Int, Int)]()
            
            while !stack.isEmpty {
                let e = stack.popLast()!
                map[e.0][e.1] = "0"
                if !discovery.contains(where: { $0 == e.0 && $1 == e.1 }) {
                    discovery.append(e)
                    let adjacency = [(e.0+1, e.1), (e.0-1, e.1), (e.0, e.1+1), (e.0, e.1-1)]
                    
                    for d in adjacency {
                        if d.0 < 0 || d.1 < 0 || d.0 >= map.count || d.1 >= map[0].count || map[d.0][d.1] == "0" {
                            continue
                        }
                        stack.append(d)
                    }
                }
            }
        }
        
        
        for r in 0..<grid.count {
            for c in 0..<grid[0].count {
                if map[r][c] == "1" {
                    dfs(r, c)
                    count += 1
                }
            }
        }
        return count
    }
}
```



### Queue를 이용한 풀이(BFS)

```swift
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var map = grid
        var count = 0
        
        func bfs(_ r: Int, _ c: Int) {
            var queue = [(r, c)]
            var discovery = [(r, c)]
            
            while !queue.isEmpty {
                let e = queue.removeFirst()
                map[e.0][e.1] = "0"
                let adjacency = [(e.0+1, e.1), (e.0-1, e.1), (e.0, e.1+1), (e.0, e.1-1)]
                for d in adjacency {
                    if d.0 < 0 || d.1 < 0 || d.0 >= map.count || d.1 >= map[0].count || map[d.0][d.1] == "0" {
                        continue
                    }
                    if !discovery.contains(where: { $0.0 == d.0 && $0.1 == d.1 }) {
                        queue.append(d)
                        discovery.append(d)
                    }
                }
            }
        }
        
        
        for r in 0..<grid.count {
            for c in 0..<grid[0].count {
                if map[r][c] == "1" {
                    bfs(r, c)
                    count += 1
                }
            }
        }
        return count
    }
}
```

