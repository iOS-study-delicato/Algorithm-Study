

### Single Number

```swift
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dic = Dictionary<Int, Int>()
        for num in nums {
            dic[num, default: 0] += 1
        }
        return dic.min(by: { $0.value < $1.value })!.key
    }
}
```



### 다른 풀이

XOR을 활용

```swift
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var a = 0
        for num in nums {
            a = a^num
        }
        return a
    }
}

extension Bool {
    static func ^ (left: Bool, right: Bool) -> Bool {
        return left != right
    }
}
```

