### Valid Parentheses



```swift
class Solution {
    func isValid(_ s: String) -> Bool {
        let dict = [
            ")": "(",
            "]": "[",
            "}": "{"
        ]
        var stack = Array<String>()
        for character in s {
            if dict.values.contains(String(character)) {
                stack.append(String(character))
            } else if stack.isEmpty || dict[String(character)] != stack.popLast()! {
                return false
            }
        }
        return stack.count == 0
    }
}
```

