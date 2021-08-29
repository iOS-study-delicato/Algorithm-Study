## Maximum Subarray



### Kadane’s Algorithm(카데인 알고리즘)

- A[4]의 부분합을 알고 있다면 A[5]의 모든 부분합을 **처음부터 다시 재계산하지 않아도** 우리는 A[5]의 부분합을 알 수가 있다.
- 하위 배열이(이전 부분합이) 양수면 다음 값을 크게 할 수 있기 때문에 양수인지 판별하는 조건문이 들어간다.

```swift
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var nums = nums
        for i in 1..<nums.count {
            if nums[i-1] > 0 {
                nums[i] += nums[i-1]
            }
        }
        return nums.max()!
    }
}

print(Solution().maxSubArray([-2,1,-3,4,-1,2,1,-5,4])) // 6
print(Solution().maxSubArray([1])) // 1
```



### Divide And Conquer



코드가 짧긴한데 이해가 잘 안됨

```swift
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        func divideAndConquer(nums: [Int], i: Int, j: Int) -> (Int, Int, Int, Int){
            if i == j-1 { return (nums[i], nums[i], nums[i], nums[i]) }
            let mid = i + (j-i) / 2
            let (a1, m1, b1, s1) = divideAndConquer(nums: nums, i: i, j: mid)
            let (a2, m2, b2, s2) = divideAndConquer(nums: nums, i: mid, j: j)
            let a = max(a1, s1+a2)
            let b = max(b2, s2+b1)
            let m = max(m1, m2, b1+a2)
            let s = s1+s2
            return (a, m, b, s)
        }
        let (_, m, _, _) = divideAndConquer(nums: nums, i: 0, j: nums.count)
        return m
    }
}
```

