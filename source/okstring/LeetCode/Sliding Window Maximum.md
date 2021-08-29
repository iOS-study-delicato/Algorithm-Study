### Sliding Window Maximum



보통의 Sliding Window - **Time Limit Exceeded**

```swift
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var result = [Int]()
        var s = 0
        var window = [Int]()
        for e in 0..<nums.count {
            window.append(nums[e])
            if e >= k-1 {
                result.append(window.max()!)
                window.removeFirst()
                s += 1
            }
        }
        return result
    }
}
```





`max()` 와 `removeFirst()` 시간 절약해보기 - **Time Limit Exceeded**

```swift
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if k == 1 {
            return nums
        }
        var result = [Int]()
        var window = [Int?]()
        var head = 0
        var maxNum = -100000

        for (i, e) in nums.enumerated() {
            window.append(e)
            if i < k-1 {
                continue
            }

            if maxNum == -100000 {
                maxNum = window[head..<head+k].max(by: { $0! < $1! })!!
            } else if e > maxNum {
                maxNum = e
            }
            result.append(maxNum)

            if maxNum == window[head] {
                maxNum = -100000
            }
            head += 1
        }
        return result
    }
}
```





### Discuss

```swift
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.isEmpty == false else { return [] }

        var left = [Int]()
        var right = [Int]()

        for i in 0..<nums.count {
            while (left.count > 0) && (nums[left.last!] < nums[i]) {
                left.removeLast()
            }
            left.append(i)

            if i >= k - 1 {
                if left.first! + k == i { left.removeFirst() }
                right.append(nums[left.first!])
            }
        }
        return right
    }
}
```

