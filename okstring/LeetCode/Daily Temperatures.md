## Daily Temperatures

monotonic stack

stack에 꼭 element가 들어갈 필요가 없다

```swift
class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: temperatures.count)
        var stack = [Int]()
        
        for (i, t) in temperatures.enumerated() {
            while !stack.isEmpty && temperatures[stack.last!] < t {
                let p = stack.popLast()!
                result[p] = i - p
            }
            stack.append(i)
        }
        return result
    }
}
```





### Discuss

https://leetcode.com/problems/daily-temperatures/discuss/838903/Python%3A-O(n)-time-and-O(1)-space-(without-Stack)

```swift
class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: temperatures.count)

        for d in stride(from: temperatures.count - 2, through: 0, by: -1) {
            var next = 1
            while next != 0 && temperatures[d + next] <= temperatures[d] {
                if result[d + next] != 0 {
                    next += result[d + next]
                } else {
                    next = 0
                }
            }
            result[d] = next
        }
        return result
    }
}

```

