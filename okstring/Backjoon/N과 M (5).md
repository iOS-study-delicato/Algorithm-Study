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



https://www.acmicpc.net/source/32952448

다른 풀이

```swift
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let nums = readLine()!.split(separator: " ").map { String($0) }.sorted(by: { Int($0)! < Int($1)! })
var visit = [Bool](repeating: false, count: nm.first!)
var sequence = [String]()
var result = ""

func dfs(_ depth: Int) {
    if depth == nm.last! {
        result += "\(sequence.joined())\n"
        return
    }
    for i in 0..<nm.first! {
        if visit[i] {
            continue
        } else {
            visit[i] = true
            sequence.append("\(nums[i]) ")
            dfs(depth + 1)
            sequence.removeLast()
            visit[i] = false
        }
    }
}

dfs(0)
print(result)
```

