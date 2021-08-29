## N과 M (4)



```swift
let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
let N = input[0]
let M = input[1]
var before = 0
func find(arr: [String]) {
    if arr.count >= M {
        print(arr.joined(separator: " "))
        return
    }
    for i in 1...N {
        if arr.isEmpty || (!arr.isEmpty && Int(arr.last!)! <= i) {
            find(arr: arr + [String(i)])
        }
    }
}
find(arr: [])
```



더 간단한 코드

```swift
let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
let N = input[0]
let M = input[1]
var before = 0
func find(arr: [String], s: Int) {
    if arr.count >= M {
        print(arr.joined(separator: " "))
        return
    }
    for i in s...N {
        find(arr: arr + [String(i)], s: i)
    }
}
find(arr: [], s: 1)
```

