# LeetCode

## [Group Anagrams](https://leetcode.com/problems/group-anagrams/)

* 난이도: Medium
* 풀이 언어: Swift
* 문제 요약: 배열에서 애너그램(철자 순서를 바꾼 말)을 찾아서 그룹핑

### 코드

```swift
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        let dictionary = Dictionary(grouping: strs, by: { $0.sorted() })
        return Array(dictionary.values)
    }
}
```

* Runtime: 200 ms, faster than 23.68% of Swift online submissions for Group Anagrams.
* Memory Usage: 17.9 MB, less than 22.15% of Swift online submissions for Group Anagrams.

```swift
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dictionary = [String : [String]]()
        strs.forEach {
            let baseString = "\($0.sorted())"
            if let anagrams = dictionary[baseString] {
                dictionary[baseString] = anagrams + [$0]
            } else {
                dictionary[baseString] = [$0]
            }
        }
        return Array(dictionary.values)
    }
}
```

* Runtime: 196 ms, faster than 25.88% of Swift online submissions for Group Anagrams.
* Memory Usage: 17.8 MB, less than 22.15% of Swift online submissions for Group Anagrams.

### 회고

* Hash Table에 대해서 학습하기
* 런타임, 메모리 효율이 20% 대에서 오르지 않는다.. 더 좋은 풀이 방법이 있는걸까? 🤔