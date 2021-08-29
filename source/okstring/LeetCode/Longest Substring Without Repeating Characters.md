### Longest Substring Without Repeating Characters.md

풀이는 파이썬 알고리즘 인터뷰를 참고했다[참고](http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791189909178)

꼭 다시 풀어볼것!!!



```swift
import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var result = 0
        var dict = Dictionary<String.Element, Int>()
        var startIndex = 0

        for (index, stringElement) in s.enumerated(){
            if dict.keys.contains(stringElement) && startIndex <= dict[stringElement, default: 0] {
                startIndex = dict[stringElement, default: 0] + 1
            } else {
                result = max(result, index - startIndex + 1)
            }
            dict[stringElement, default: 0] = index
        }

        return result
    }
}


var s = Solution()
print(s.lengthOfLongestSubstring("tmmzuxtt"))

```

