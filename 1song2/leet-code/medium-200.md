# LeetCode

## [Number of Islands](https://leetcode.com/problems/number-of-islands/)

* 난이도: Medium
* 풀이 언어: Swift
* 문제 요약: grid에서 섬의 개수 구하기

### 코드

```swift
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let rowCount: Int = grid.count
        let columnCount: Int = grid[0].count
        /// (땅인지 물인지, 이미 확인했는지)
        var newGrid: [[(Bool, Bool)]] = []
        var result: Int = 0
        newGrid = grid.map { row in
            row.map { character in
                return (character == "1", false)
            }
        }

        func findAdjacentLand(row: Int, column: Int) {
            let directions = [(-1, 0), (0, -1), (1, 0), (0, 1)]
            for direction in directions {
                let adjacentRow = row + direction.0
                let adjacentColumn = column + direction.1
                if adjacentRow < 0 || adjacentColumn < 0 || adjacentRow >= rowCount || adjacentColumn >= columnCount {
                    continue
                }
                if newGrid[adjacentRow][adjacentColumn] == (true, false) {
                    newGrid[adjacentRow][adjacentColumn].1 = true
                    findAdjacentLand(row: adjacentRow, column: adjacentColumn)
                }
            }
        }

        for rowIndex in 0..<rowCount {
            for columnIndex in 0..<columnCount {
                if newGrid[rowIndex][columnIndex] == (true, false) {
                    result += 1
                    findAdjacentLand(row: rowIndex, column: columnIndex)
                }
            }
        }
        return result
    }
}
```

### 회고

* BFS와 DFS의 차이를 알랑말랑 🤔
* 확인한 영역인지 아닌지 차이를 따로 표시할게 아니라 "0"으로 바꿔주면 된다가 포인트인듯 (이 풀이로 다시 한번 풀어보기)