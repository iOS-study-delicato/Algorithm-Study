### Jewels and Stones

dictionary 활용 문제



```swift
import Foundation

class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        var dict = Dictionary<String, Int>()
        var result = 0
        for jewel in jewels {
            dict[String(jewel), default: 0] += 1
        }
        for stone in stones {
            if dict[String(stone)] != nil {
                result += 1
            }
        }
        return result
    }
}
```

