### Decode String





```swift
class Solution {
    func decodeString(_ s: String) -> String {
        var stack = [String]()
        var cNum = 0
        var cStr = ""
        
        for c in s {
            if c == "[" {
                stack.append(cStr)
                stack.append(String(cNum))
                cStr = ""
                cNum = 0
            } else if c == "]" {
                let num = stack.popLast()!
                let prevStr = stack.popLast()!
                cStr = prevStr + String(repeating: cStr, count: Int(num)!)
            } else if c.isNumber {
                cNum = cNum * 10 + Int(String(c))!
            } else {
                cStr += String(c)
            }
        }
        return cStr
    }
}
```

