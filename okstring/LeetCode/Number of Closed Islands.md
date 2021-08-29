

### Number of Closed Islands



```python
class Solution {
    func closedIsland(_ grid: [[Int]]) -> Int {
        if grid[0].count <= 0 || grid.count <= 0 { return 0 }
        var tmpGrid = grid
        var result = 0
        let r = tmpGrid.count, c = tmpGrid[0].count
        func dfs(ir: Int, ic: Int, g: inout [[Int]]) {
            if ir < 0 || ic < 0 || ir >= r || ic >= c || g[ir][ic] == 1 {
                return
            }
            g[ir][ic] = 1
            dfs(ir: ir+1, ic: ic, g: &g)
            dfs(ir: ir-1, ic: ic, g: &g)
            dfs(ir: ir, ic: ic+1, g: &g)
            dfs(ir: ir, ic: ic-1, g: &g)
        }
        for ir in 0..<r {
            for ic in 0..<c {
                if (ir == 0 || ic == 0 || ir == r - 1 || ic == c - 1) && tmpGrid[ir][ic] == 0 {
                    dfs(ir: ir, ic: ic, g: &tmpGrid)
                }
            }
        }
        for ir in 0..<r {
            for ic in 0..<c {
                if tmpGrid[ir][ic] == 0 {
                    dfs(ir: ir, ic: ic, g: &tmpGrid)
                    result += 1
                }
            }
        }
        return result
    }
}
```

