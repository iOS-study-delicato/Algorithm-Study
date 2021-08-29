### Recursive

Recursive2 - Divide and Conquer

Merge Sort를 연습해본다



- 정렬되지 않은 목록을 여러 하위 목록으로 나누고(Divide)

- 각 하위목록을 재귀적으로 정렬(Conquer)

- 정렬된 하위 목록을 병합하여 새 정렬된 목록을 생성(Combine)



```swift
class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 {
            return nums
        }
        
        let index = nums.count / 2
        
        let left = sortArray(Array(nums[0..<index]))
        let right = sortArray(Array(nums[index..<nums.count]))
        
        return merge(left, right)
    }
    
    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        var result = [Int]()
        
        while leftIndex < left.count && rightIndex < right.count {
            if left[leftIndex] > right[rightIndex] {
                result.append(right[rightIndex])
                rightIndex += 1
            } else if left[leftIndex] < right[rightIndex] {
                result.append(left[leftIndex])
                leftIndex += 1
            } else {
                result.append(left[leftIndex])
                result.append(right[rightIndex])
                leftIndex += 1
                rightIndex += 1
            }
        }
        result.append(contentsOf: left[leftIndex..<left.count])
        result.append(contentsOf: right[rightIndex..<right.count])
        
        return result
    }
}
```

- `append(contentsOf:)` 를 이용하면 `+` 와 같이 Array를 이어붙일 수 있다