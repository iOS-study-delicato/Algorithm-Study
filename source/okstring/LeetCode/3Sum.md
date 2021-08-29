### 3Sum

몇일을 풀었지만 못풀린 문제.. 다시 풀어보도록 하자!

투포인터

```swift
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
      // 미리 리턴
        if nums.count < 3 {
            return []
        }
      // 정렬
        let ns = nums.sorted()
        
        for fIndex in 0..<ns.count - 2 {
          // fIndex 수가 같으면 continue
            if fIndex != 0 && ns[fIndex - 1] == ns[fIndex] { continue }
            
            var sIndex = fIndex + 1
            var tIndex = ns.count - 1
            
            while sIndex < tIndex {
                let sum = ns[fIndex] + ns[sIndex] + ns[tIndex]
                
              // 투포인터
                if sum < 0 {
                    sIndex += 1
                } else if sum > 0 {
                    tIndex -= 1
                } else {
                    result.append([ns[fIndex], ns[sIndex], ns[tIndex]])
                  // 수가 같으면 다음 수
                    while sIndex < tIndex && ns[sIndex] == ns[sIndex + 1] {
                        sIndex += 1
                    }
                    while sIndex < tIndex && ns[tIndex] == ns[tIndex - 1] {
                        tIndex -= 1
                    }
                    sIndex += 1
                    tIndex -= 1
                }
            }
        }
        return result
    }
}
```

