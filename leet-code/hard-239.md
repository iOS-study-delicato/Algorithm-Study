# LeetCode

## [Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/)

* 난이도: Hard
* 풀이 언어: Swift
* 문제 요약: k 크기의 창문을 오른쪽으로 한 칸씩 옮겨갈 때, 창문 중 가장 큰 숫자들의 배열 구하기

### 코드

```swift
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if k == 1 { return nums }
        var deque = [(Int, Int)]() //(num, index)
        var result = [Int]()
        for index in 0..<nums.count {
            if !deque.isEmpty && index == deque.first!.1 + k {
                deque.removeFirst()
            }
            while !deque.isEmpty && deque.last!.0 <= nums[index] {
                deque.removeLast()
            }
            
            deque.append((nums[index], index))
            if index >= k - 1 {
                result.append(deque.first!.0)
            }
        }
        return result
    }
}
```

### 회고

* 처음에는 for문으로 index를 하나씩 증가시켜가며 `nums[index..<index + k]` 중 가장 큰 값을 배열에 더하는 방식으로 풀었으나... 문제의 난이도가 hard인 것을 보아 이 풀이로는 풀리지 않겠다는 것을 예측할 수 있었다 😇 역시나 k가 50,000인 케이스에서 Time Limit Exceeded가 걸리고 만다.
* 문제에 주어진 힌트는 다음과 같다:
  * Hint 1: How about using a data structure such as deque (double ended queue)?
  * Hint 2: The queue size need not be the same as the window’s size.
  * Hint 3: Remove redundant elements and the queue should store only elements that need to be considered.
* 핵심은 2번이라고 생각하는데, k가 50,000이라면 50,000개의 요소를 모두 배열에 담아 그중 최대값을 찾는 대신 새로 추가될 값보다 작은 값들은 queue에서 삭제해 효율을 높이는 것이다. 윈도우의 크기를 벗어나는 요소는 queue에서 제외해주어야 하므로 큐의 양쪽 끝에서 모두 삽입과 삭제가 가능한 deque를 사용해야 한다.
* Cf. deque는 덱이라고 읽고, dequeue는 디큐 등으로 읽는 듯 하다!
* Cf. 곧 Swift에서도 deque를 만나볼 수 있는 듯 하다! [참고1](https://swift.org/blog/swift-collections/) [참고2](https://github.com/apple/swift-collections)