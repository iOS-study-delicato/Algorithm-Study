### N개의 최소공배수



GCD, LCM

```swift
func gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : gcd(b, a % b)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func solution(_ arr:[Int]) -> Int {
    return arr.reduce(1, { lcm($0, $1) })
}
```

