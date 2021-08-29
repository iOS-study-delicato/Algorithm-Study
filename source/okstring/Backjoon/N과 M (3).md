## N과 M (3)

파라미터에 카운트를 하면 더 빠르다

```swift
let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
let N = input[0]
let M = input[1]

func find(arr: [String]) {
    if arr.count >= M {
        print(arr.joined(separator: " "))
        return
    }
    for i in 1...N {
        find(arr: arr + [String(i)])
    }
}
find(arr: [])
```

