

## First Unique Character in a String

```swift
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dict = Dictionary<String, Array<Int>>()
        for (index, c) in s.enumerated() {
            dict[String(c), default: [0, 0]][0] += 1
            dict[String(c)]![1] = index
        }
        let resultArr = dict.filter { (dict) -> Bool in
            return dict.value[0] == 1
        }.sorted { (before, after) -> Bool in
            before.value[1] < after.value[1]
        }
        
        return resultArr.isEmpty ? -1 : resultArr[0].value[1]
    }
}
```





### leetcode most votes

```swift
func firstUniqChar(_ s: String) -> Int {
        
        var dict = [Character : Int]()
        
        for i in s {
            dict[i] = dict[i] != nil ? dict[i]! + 1 : 1
        }
        
        for (index,char) in s.enumerated() {
            
            if let value = dict[char]
            {
                if value == 1{
                    return index
                }
            }
        }
        
        return -1
    }
```

