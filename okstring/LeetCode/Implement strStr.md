### Implement strStr()



```swift
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count > haystack.count {
            return -1
        } else if needle == "" {
            return 0
        }
        
        let tmpHaystack = Array(haystack)
        let tmpNeedle = Array(needle)
        
        for s in 0..<haystack.count-needle.count+1 {
            if tmpHaystack[s] == tmpNeedle[0],
               tmpHaystack[s...s+tmpNeedle.count-1].map({ $0 }) == tmpNeedle {
                return s
            }
        }
        return -1
        
    }
}
```









### 다른 풀이

973 ms

https://leetcode.com/problems/implement-strstr/discuss/1656830/Solution-Swift%3A-Implement-strStr()-%2B-test-cases

```swift
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if haystack == needle || needle == ""{
            return 0
        }
        if haystack == "" || haystack.count < needle.count{
            return -1
        }
        var arr1 = Array(haystack)
        var arr2 = Array(needle)
        label: for i in 0..<arr1.count-arr2.count+1{
            if arr1[i] == arr2[0]{
                for j in 0..<arr2.count{
                    if arr1[i+j] != arr2[j]{
                        continue label
                    }
                }
                return i
            }
        }
        return -1
    }   
}
```





1058 ms

https://leetcode.com/problems/implement-strstr/discuss/685262/Swift-4~20ms-simple-answer

```swift
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if haystack.count == needle.count {
            return haystack != needle ? -1 : 0
        } else if needle.isEmpty {
            return 0
        }
        
        let count = haystack.components(separatedBy: needle)[0].count
        return count != haystack.count ? count : -1
    }
}
```

