### Max Area of Island



문제를 꼼꼼하게 보자!!

```swift
class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var tmpGrid = grid
        var result = 0
        
        func dfs(r: Int, c: Int, count: inout Int) {
          //인덱스 벗어나면 리턴
            if r < 0 || c < 0 || r >= grid.count || c >= grid[r].count || tmpGrid[r][c] == 0 {
                return
            }
            tmpGrid[r][c] = 0
            count += 1
            dfs(r: r + 1, c: c, count: &count)
            dfs(r: r, c: c + 1, count: &count)
            dfs(r: r - 1, c: c, count: &count)
            dfs(r: r, c: c - 1, count: &count)
        }
        
        for (ir, r) in tmpGrid.enumerated() {
            for (ic, c) in r.enumerated() {
                if c == 1 {
                  //섬 갯수 세기
                    var count = 0
                    dfs(r: ir, c: ic, count: &count)
                    result = max(result, count)
                    
                }
            }
        }
        return result
    }
}
```

