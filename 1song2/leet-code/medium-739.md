# LeetCode

## [Daily Temperatures](https://leetcode.com/problems/daily-temperatures/)

* 난이도: Medium
* 풀이 언어: Swift
* 문제 요약: 일별 기온 배열이 주어질 때 며칠을 기다리면 더 따듯한 날이 오는지 배열로 반환

### 코드

```swift
class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: temperatures.count)
        var stack = [(Int, Int)]() //(num, index)
        var index = temperatures.count - 1
        while index >= 0 {
            while !stack.isEmpty && stack.last!.0 <= temperatures[index] {
                stack.removeLast()
            }
            if !stack.isEmpty {
                result[index] = stack.last!.1 - index
            }
            stack.append((temperatures[index], index))
            index -= 1
        }
        return result
    }
}
```

### 회고

* 지난번 풀었던 [Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/)이 `Monotonic Queue`이었다면 이번 문제는 `Monotonic Stack`이다.
* 두 유형의 흐름이 상당히 유사하지만, 아직 익숙하지 않아 바로 적용하기는 힘들었다 🙄 잘 익혀두도록 하자!