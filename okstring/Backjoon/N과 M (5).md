## N과 M (5)

백트래킹, 순열, DFS

```swift
let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
let N = input[0]
let M = input[1]
let nums = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted(by: <)
var visited = Array(repeating: false, count: nums.count)
var result = [Int]()

func back(cnt: Int) {
    if cnt == M {
        print(result.map({ String($0) }).joined(separator: " "))
        return
    }

    for i in 0..<nums.count {
        if visited[i] {
            continue
        }
        visited[i] = true
        result.append(nums[i])
        back(cnt: cnt+1)
        result.removeLast()
        visited[i] = false
    }
}

back(cnt: 0)
```

