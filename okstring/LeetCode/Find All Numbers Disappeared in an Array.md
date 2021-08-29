### Find All Numbers Disappeared in an Array



```swift
class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var ns = nums
        var result = [Int]()
        for index in 0..<nums.count {
            let num = abs(ns[index])
            if ns[num - 1] > 0 {
                // 있는 위치는 음수로
                ns[num - 1] = -ns[num - 1]
            }
        }
        for index in 0..<ns.count {
            if ns[index] > 0 {
              // 양수 위치는 없는 숫자
                result.append(index + 1)
            }
        }
        return result
    }
}
```

