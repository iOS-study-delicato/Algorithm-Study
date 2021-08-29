### Majority Element



Majority : 과반수

```swift
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var dict = Dictionary<Int, Int>()
        for num in nums {
            dict[num, default: 0] += 1
        }
        return dict.max(by: { $0.value < $1.value })!.key
    }
}
```



sorted를 이용해 중간지점을 빼도 된다.

