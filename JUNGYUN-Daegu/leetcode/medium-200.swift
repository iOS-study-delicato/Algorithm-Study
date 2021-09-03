class Solution {

    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
     
        if grid.isEmpty {
            return 0
        }
        
        var count = 0
        
        let rows = grid.count
        let cols = grid[0].count
        
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == "1" {
                    
                    self.BFS(grid: &grid, i, j)
                    
                    count += 1
                }
            }
        }
        return count
    }

    func BFS(grid: inout [[Character]], _ row: Int, _ col: Int) {
        var q = [[Int]]()
        q.append([row,col])
        grid[row][col] = "0"
        
        while !q.isEmpty {
            let i = q.first![0]
            let j = q.first![1]
            q.remove(at: 0)
            
            if i-1 >= 0 && grid[i-1][j] == "1" {
                grid[i-1][j] = "0"
                q.append([i-1, j])
            }
            if i+1 < grid.count && grid[i+1][j] == "1" {
                grid[i+1][j] = "0"
                q.append([i+1, j])
            }
            if j-1 >= 0 && grid[i][j-1] == "1" {
                grid[i][j-1] = "0"
                q.append([i, j-1])
            }
            if j+1 < grid[0].count && grid[i][j+1] == "1" {
                grid[i][j+1] = "0"
                q.append([i, j+1])
            }
        }
    }

}
