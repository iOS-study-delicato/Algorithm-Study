### Sign of the Product of an Array



```swift
class Solution {
    func arraySign(_ nums: [Int]) -> Int {
        var result = 1
        for num in nums {
            if num == 0 { return 0 }
            result *= num > 0 ? 1 : -1
        }
        return result > 0 ? 1 : -1
    }
}
```

