## N과 M (2)

해가 아니거나 막히면 되돌아가서 다시 해를 찾아가는것이 백트래킹의 핵심이다.



```swift
let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = input[0], m = input[1]

func back(i: Int, numArr: [String]) {
    if i == m {
        print(numArr.joined(separator: " "))
        return
    }
    for n in 1...n {
        if numArr.isEmpty || (!numArr.isEmpty && numArr.last! < String(n)) {
            back(i: i+1, numArr: numArr + ["\(n)"])
        }
    }
}

back(i: 0, numArr: [String]())
```

