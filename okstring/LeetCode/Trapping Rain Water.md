### Trapping Rain Water

직관적으로 떠오르지 않는 문제 꼭 다시 한 번 더 풀어보기



#### 스택 활용

```swift
class Solution {
    func trap(_ height: [Int]) -> Int {
        var result = 0
        // 스택에 계속 채운다
        var stack = [Int]()
        
        for index in 0..<height.count {
            while !stack.isEmpty && height[index] > height[stack.last!] {
                // 실제로는 가장 밑
                let top = stack.popLast()!
                
                // 시작부분은 포함하지 않아야 하기 때문에
                if stack.isEmpty { break }
                
                // pop한 후 last element
                let distance = index - stack.last! - 1
                
                // 현재 height와 last의 min을 top으로 빼준다
                let water = min(height[index], height[stack.last!]) - height[top]
                
                result += distance * water
            }
            stack.append(index)
        }
        return result
    }
}
```



#### 투 포인터 활용

```swift

class Solution {
    func trap(_ height: [Int]) -> Int {
        if height.isEmpty { return 0 }
        var result = 0
        var left = 0
        var right = height.count - 1
        var maxLeft = height[left]
        var maxRight = height[right]
        
        while left < right {
            // 더 높은 곳을 향해 투 포인터 이동
            maxLeft = max(maxLeft, height[left])
            maxRight = max(maxRight, height[right])
            
            if maxLeft <= maxRight {
                result += maxLeft - height[left]
                left += 1
            } else {
                result += maxRight - height[right]
                right -= 1
            }
        }
        
        return result
    }
}
```

