# LeetCode

## [01 Matrix](https://leetcode.com/problems/01-matrix/)

* 난이도: Medium
* 풀이 언어: Swift
* 문제 요약: 0과 1로 이루어진 행렬에서 0까지의 최단 거리 구하기

### 코드

##### 1. DP Approach

```swift
class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let maxRow = mat.count
        let maxColumn = mat[0].count
        let maxDistance = maxRow + maxColumn - 2
        var resultMat: [[Int]] = Array(repeating: Array(repeating: maxDistance, count: maxColumn), count: maxRow)
        // Top-Left
        for rowIndex in 0..<maxRow {
            for columnIndex in 0..<maxColumn {
                if mat[rowIndex][columnIndex] == 0 {
                    resultMat[rowIndex][columnIndex] = 0
                } else {
                    if rowIndex > 0 {
                        resultMat[rowIndex][columnIndex] = min(resultMat[rowIndex][columnIndex], resultMat[rowIndex - 1][columnIndex] + 1)
                    }
                    if columnIndex > 0 {
                        resultMat[rowIndex][columnIndex] = min(resultMat[rowIndex][columnIndex], resultMat[rowIndex][columnIndex - 1] + 1)
                    }
                }
            }
        }
        // Bottom-Right
        for rowIndex in stride(from: maxRow - 1, through: 0, by: -1) {
            for columnIndex in stride(from: maxColumn - 1, through: 0, by: -1) {
                if rowIndex < maxRow - 1 {
                    resultMat[rowIndex][columnIndex] = min(resultMat[rowIndex][columnIndex], resultMat[rowIndex + 1][columnIndex] + 1)
                }
                if columnIndex < maxColumn - 1 {
                    resultMat[rowIndex][columnIndex] = min(resultMat[rowIndex][columnIndex], resultMat[rowIndex][columnIndex + 1] + 1)
                }
            }
        }
        return resultMat
    }
}
```

* Time complexity: *O(r⋅c)*
* Space complexity: *O(r⋅c)* but slightly less due to no directions and no queues
* 개인적으로 풀이 방식이 잘 와닿지 않는다...

##### 2. BFS Approach

```swift
class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let maxRow = mat.count
        let maxColumn = mat[0].count
        var resultMat: [[Int]] = []
        var queue: [(Int, Int)] = []
        var queueCount: Int = 0
        var head: Int = 0

        resultMat = mat.enumerated().map { rowIndex, row in
            row.enumerated().map { columnIndex, number in
                if number == 0 {
                    queue.append((rowIndex, columnIndex))
                    queueCount += 1
                    return 0
                } else {
                    return Int.max
                }
            }
        }

        let directions = [(-1, 0), (0, -1), (1, 0), (0, 1)]

        while head < queueCount {
            let (row, column) = queue[head]
            for direction in directions {
                let adjacentRow = row + direction.0
                let adjacentColumn = column + direction.1
                if adjacentRow < 0 || adjacentRow >= maxRow || adjacentColumn < 0 || adjacentColumn >= maxColumn { continue }
                if resultMat[adjacentRow][adjacentColumn] == Int.max {
                    resultMat[adjacentRow][adjacentColumn] = resultMat[row][column] + 1
                    queue.append((adjacentRow, adjacentColumn))
                    queueCount += 1
                }
            }
            head += 1
        }
        return resultMat
    }
}
```

* Time complexity: *O(r⋅c)*
* Space complexity: *O(r⋅c)*

### 회고

* 알고리즘 유형에 대한 학습이 필요하다! BFS부터 시작하자
* `head`나 `queueCount`를 사용하지 않고 queue에 직접 더하고 빼는 방식으로 풀이 시도해보기