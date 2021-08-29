## Move Zeroes

임시 배열을 두지 않고 풀어야 한다.

```swift
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var count = 0
        var index = 0
        while count < nums.count {
            if nums[index] == 0 {
                nums.append(nums[index])
                nums.remove(at: index)
            } else {
                index += 1
            }
            count += 1
            
        }
    }
}
```

