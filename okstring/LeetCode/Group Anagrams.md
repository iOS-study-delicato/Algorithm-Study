### Group Anagrams



```swift
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()
        strs.forEach { (str) in
            dict[String(str.sorted()), default: [String]()].append(str)
        }
        return dict.values.compactMap({ $0 })
    }
}
```

