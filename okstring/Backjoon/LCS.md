## LCS



https://twinw.tistory.com/126

https://kbw1101.tistory.com/25



### 40mm

```swift
let strA = Array(readLine()!).map({ String($0) })
let strB = Array(readLine()!).map({ String($0) })

var matrix = Array(repeating: Array(repeating: 0, count: strA.count + 1), count: strB.count + 1)

var idx = 0

for i in 0..<strB.count {
    for j in 0..<strA.count {
        
        if strA[j] == strB[i] {
            matrix[i+1][j+1] = matrix[i][j] + 1
        } else {
            matrix[i+1][j+1] = max(matrix[i+1][j], matrix[i][j+1])
        }
        
    }
}

print(matrix[strB.count][strA.count])
```





### 32mm

https://www.acmicpc.net/source/33702385

```swift
let a = [0] + Array(readLine()!).compactMap(\.asciiValue)
let b = [0] + Array(readLine()!).compactMap(\.asciiValue)
var memo = [[Int]](repeating: [Int](repeating: 0, count: b.count), count: a.count)
for i in 1..<a.count {
    for j in 1..<b.count {
        if a[i] == b[j] {
            memo[i][j] = memo[i-1][j-1] + 1
        } else {
            memo[i][j] = max(memo[i-1][j], memo[i][j-1])
        }
    }
}
print(memo.last!.last!)
```

