## N과 M (1)

백트래킹 첫 번째

DP와 구분해야 한다

```swift
let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = input[0], m = input[1]

func back(i: Int, result: [String]) {
    if i == m {
        print(result.joined(separator: " "))
        return
    }
    for n in 1...n {
        if !result.contains("\(n)") {
            back(i: i+1, result: result + ["\(n)"])
        }
    }
}

back(i: 0, result: [String]())
```

