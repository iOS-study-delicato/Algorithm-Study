### Z

재귀의 모양을 이해해아 한다

https://thoonk.tistory.com/47

```swift
func solution() -> Int {
    let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
    let N = 2 << (input[0]-1), r = input[1], c = input[2]
    var result = 0
    var isFinish = false
    
    func recu(n: Int, cr: Int, cc: Int) {
        if cr == r && cc == c {
            isFinish = true
            return
        } else if isFinish {
            return
        } else if !(cr <= r && r < cr + n && cc <= c && c < cc + n) {
            result += n * n
            return
        }
        
        recu(n: n / 2, cr: cr, cc: cc)
        recu(n: n / 2, cr: cr, cc: cc + n / 2)
        recu(n: n / 2, cr: cr + n / 2, cc: cc)
        recu(n: n / 2, cr: cr + n / 2, cc: cc + n / 2)
    }
    
    recu(n: N, cr: 0, cc: 0)
    return result
}

print(solution())
```

